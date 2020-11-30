import 'dart:io';
import 'dart:async';
import 'dart:isolate';

import 'package:msgpack_dart/msgpack_dart.dart' as mpack;
import './ext_types.dart';

const REQUEST = 0;
const RESPONSE = 1;
const NOTIFICATION = 2;

/// Parameters to function are Neovim instance, method, args
typedef NvimHandler = void Function(Nvim, String, List<dynamic>);

enum _NvimIsolateMsgType {
  Request,
  Response,
  Notification,
}

class _NvimIsolateMsg {
  final _NvimIsolateMsgType msgType;
  final dynamic data;
  final int maybeResponseId;
  final String maybeMethod;

  _NvimIsolateMsg(
      {this.msgType, this.data, this.maybeResponseId, this.maybeMethod});
}

class Nvim {
  final Map<int, Completer<dynamic>> _waiting = {};
  int _nextReqId = 0;

  final bool isChild;
  Isolate _nvimIsolate;
  Stream _nvimRxStream;
  SendPort _nvimTxPort;

  Nvim._spawn(String nvimBinary, List<String> commandArgs) : isChild = false;

  Nvim._child() : isChild = true;

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

    // TODO(smolck): Use isolates for this too like with `Nvim.spawn`?
    stdin.listen((data) => _listener(nvim, data));

    return nvim;
  }

  static void eventLoopIsolate(SendPort sendPort) async {
    final receivePort = ReceivePort();
    final nvimProc = await Process.start('nvim', ['--embed']);

    // Pass any data sent from main thread to neovim process.
    receivePort.listen((data) {
      nvimProc.stdin.add(data);
    });

    // First message gives a way for main isolate to communicate with this one.
    sendPort.send(receivePort.sendPort);

    // Event loop.
    await for (final data in nvimProc.stdout) {
      final List<dynamic> deserialized =
          mpack.deserialize(data, extDecoder: ExtTypeDecoder());
      switch (deserialized[0]) {
        case RESPONSE:
          if (deserialized[2] != null) {
            // TODO(smolck)
            // Throw any errors from Neovim.
            throw deserialized[2][1];
          }
          sendPort.send(
            _NvimIsolateMsg(
              msgType: _NvimIsolateMsgType.Response,
              data: deserialized[3],
              maybeResponseId: deserialized[1],
            ),
          );
          break;
        case REQUEST:
          sendPort.send(
            _NvimIsolateMsg(
              msgType: _NvimIsolateMsgType.Request,
              maybeMethod: deserialized[2],
              data: deserialized[3],
            ),
          );
          break;
        case NOTIFICATION:
          sendPort.send(
            _NvimIsolateMsg(
              msgType: _NvimIsolateMsgType.Notification,
              maybeMethod: deserialized[1],
              data: deserialized[2],
            ),
          );
          break;
      }
    }
  }

  static Future<Nvim> spawn(
      {String nvimBinary = 'nvim',
      List<String> commandArgs = const ['--embed'],
      NvimHandler onNotify,
      NvimHandler onRequest}) async {
    var nvim = Nvim._spawn(nvimBinary, commandArgs);
    if (onRequest != null) {
      nvim.onRequest = onRequest;
    }

    if (onNotify != null) {
      nvim.onNotify = onNotify;
    }

    final receivePort = ReceivePort();
    nvim._nvimIsolate = await Isolate.spawn(eventLoopIsolate, receivePort.sendPort);
    nvim._nvimRxStream = receivePort.asBroadcastStream();
    nvim._nvimTxPort = await nvim._nvimRxStream.first;

    nvim._nvimRxStream.listen((msg) {
      if (msg is SendPort) {
        nvim._nvimTxPort = msg;
      } else if (!(msg is _NvimIsolateMsg)) {
        throw 'This should not happen, maybe open an issue at https://github.com/smolck/dart-nvim-api/issues';
      } else if (msg is _NvimIsolateMsg) {
        switch (msg.msgType) {
          case _NvimIsolateMsgType.Response:
            nvim._waiting[msg.maybeResponseId].complete(msg.data);
            break;
          case _NvimIsolateMsgType.Notification:
            nvim._onNotify(nvim, msg.maybeMethod, msg.data);
            break;
          case _NvimIsolateMsgType.Request:
            nvim._onRequest(nvim, msg.maybeMethod, msg.data);
            break;
        }
      }
    });

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

    if (isChild) {
      stdout.add(mpack.serialize(cmd, extEncoder: ExtTypeEncoder()));
    } else {
      _nvimTxPort.send(mpack.serialize(cmd, extEncoder: ExtTypeEncoder()));
    }

    _waiting[reqId] = Completer();
    return _waiting[reqId].future;
  }

  void kill() {
    if (_nvimIsolate != null) {
      _nvimIsolate.kill();
    }
  }
}
