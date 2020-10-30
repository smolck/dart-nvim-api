import 'dart:io';
import 'dart:async';

import 'package:msgpack_dart/msgpack_dart.dart' as mpack;

const REQUEST = 0;
const RESPONSE = 1;
const NOTIFICATION = 2;

typedef NvimHandler = void Function(Nvim, String, List<dynamic>);

class Nvim {
  final Future<Process> _nvimFut;
  final Map<int, Completer<dynamic>> _waiting = {};
  Process _nvim;
  int _nextReqId = 0;

  Nvim._spawn(String nvimBinary, List<String> commandArgs)
      : _nvimFut = Process.start(nvimBinary, commandArgs);

  Nvim._child() : _nvimFut = null;

  static void _listener(Nvim nvim, dynamic data,
      {
      // Neovim instance, event, args
      NvimHandler onNotify,
      // Neovim instance, method, args
      NvimHandler onRequest}) {
    final List<dynamic> deserialized = mpack.deserialize(data);
    switch (deserialized[0]) {
      case RESPONSE:
        // TODO(smolck): Verify `deserialized[1]` is the id.
        nvim._waiting[deserialized[1]].complete(deserialized[3]);
        break;
      case REQUEST:
        onRequest(nvim, deserialized[2], deserialized[3]);
        break;
      case NOTIFICATION:
        onNotify(nvim, deserialized[1], deserialized[2]);
        break;
    }
  }

  static Future<Nvim> child(
      {NvimHandler onNotify, NvimHandler onRequest}) async {
    var nvim = Nvim._child();
    stdin.listen((data) =>
        _listener(nvim, data, onNotify: onNotify, onRequest: onRequest));

    return nvim;
  }

  static Future<Nvim> spawn(
      {String nvimBinary = 'nvim',
      List<String> commandArgs = const ['--embed'],
      NvimHandler onNotify,
      NvimHandler onRequest}) async {
    var nvim = Nvim._spawn(nvimBinary, commandArgs);
    nvim._nvim = await nvim._nvimFut;
    nvim._nvim.stdout.listen((data) =>
        _listener(nvim, data, onNotify: onNotify, onRequest: onRequest));

    return nvim;
  }

  Future<dynamic> _call(String method, {List<dynamic> args}) {
    final reqId = _nextReqId;
    _nextReqId++;

    final cmd = [
      0,
      reqId,
      method,
      if (args != null) args else [],
    ];

    if (_nvim != null) {
      _nvim.stdin.add(mpack.serialize(cmd));
    } else {
      stdout.add(mpack.serialize(cmd));
    }

    _waiting[reqId] = Completer();
    return _waiting[reqId].future;
  }
}
