import 'dart:io';
import 'dart:async';

import 'package:msgpack_dart/msgpack_dart.dart' as mpack;
import './ext_types.dart';

const REQUEST = 0;
const RESPONSE = 1;
const NOTIFICATION = 2;

/// Parameters to function are Neovim instance, method, args
typedef NvimHandler = void Function(Nvim, String, List<dynamic>);

class Nvim {
  final Future<Process> _nvimFut;
  final Map<int, Completer<dynamic>> _waiting = {};
  Process _nvim;
  int _nextReqId = 0;

  Nvim._spawn(String nvimBinary, List<String> commandArgs)
      : _nvimFut = Process.start(nvimBinary, commandArgs);

  Nvim._child() : _nvimFut = null;

  NvimHandler _onNotify;
  NvimHandler _onRequest;

  set onNotify(NvimHandler newHandler) => _onNotify = newHandler;
  set onRequest(NvimHandler newHandler) => _onRequest = newHandler;

  static void _listener(Nvim nvim, dynamic data) {
    final List<dynamic> deserialized =
        mpack.deserialize(data, extDecoder: ExtTypeDecoder());
    switch (deserialized[0]) {
      case RESPONSE:
        if (deserialized[2] != null) {
          // Throw any errors from Neovim.
          throw deserialized[2][1];
        }
        // TODO(smolck): Verify `deserialized[1]` is the id.
        nvim._waiting[deserialized[1]].complete(deserialized[3]);
        break;
      case REQUEST:
        nvim._onRequest(nvim, deserialized[2], deserialized[3]);
        break;
      case NOTIFICATION:
        nvim._onNotify(nvim, deserialized[1], deserialized[2]);
        break;
    }
  }

  static Future<Nvim> child(
      {NvimHandler onNotify, NvimHandler onRequest}) async {
    var nvim = Nvim._child();
    if (onRequest != null) {
      nvim.onRequest = onRequest;
    }
    if (onNotify != null) {
      nvim.onNotify = onNotify;
    }

    stdin.listen((data) => _listener(nvim, data));

    return nvim;
  }

  static Future<Nvim> spawn(
      {String nvimBinary = 'nvim',
      List<String> commandArgs = const ['--embed'],
      NvimHandler onNotify,
      NvimHandler onRequest}) async {
    var nvim = Nvim._spawn(nvimBinary, commandArgs);
    nvim._nvim = await nvim._nvimFut;
    if (onRequest != null) {
      nvim.onRequest = onRequest;
    }

    if (onNotify != null) {
      nvim.onNotify = onNotify;
    }

    nvim._nvim.stdout.listen((data) => _listener(nvim, data));

    return nvim;
  }

  Future<dynamic> call(String method, {List<dynamic> args}) {
    final reqId = _nextReqId;
    _nextReqId++;

    final cmd = [
      0,
      reqId,
      method,
      if (args != null) args else [],
    ];

    if (_nvim != null) {
      _nvim.stdin.add(mpack.serialize(cmd, extEncoder: ExtTypeEncoder()));
    } else {
      stdout.add(mpack.serialize(cmd, extEncoder: ExtTypeEncoder()));
    }

    _waiting[reqId] = Completer();
    return _waiting[reqId].future;
  }

  void kill() {
    _nvim.kill();
  }
}
