import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:msgpack_dart/msgpack_dart.dart';
import 'package:dart_nvim_api/dart_nvim_api.dart';

/// Enum representing messagepack message types.
enum Msg {
  Request,
  Response,
  Notification,
}

/// Converts an integer `type` into a `Msg`.
///
/// Throws an [ArgumentError] if `type` is not between 0-2 inclusive.
Msg _intToMsg(int type) {
  switch (type) {
    case 0:
      return Msg.Request;
    case 1:
      return Msg.Response;
    case 2:
      return Msg.Notification;
    default:
      throw ArgumentError("`type` must be an integer between 0-2 inclusive.");
  }
}

class ExtTypeDecoder extends ExtDecoder {
  dynamic decodeObject(int extType, Uint8List data) {
    switch (extType) {
      case 0: // ID for a `Buffer`
        return Buffer(deserialize(data));
      case 1: // ID for a `Window`
        return Window(deserialize(data));
      case 2: // ID for a `Tabpage`
        return Tabpage(deserialize(data));
    }
  }
}

class Session {
  /// Neovim [Process] if [Session] is constructed via the default constructor.
  /// Otherwise, `null`.
  final Future<Process> _nvim;
  final bool _communicateStdin;
  final bool _communicateNvimStdin;

  /// Id to use for sending messages to Neovim.
  int _senderId = 0;

  /// [Socket] used to communicate with Neovim if [Session] is constructed via
  /// [Session.fromRunningInstance()]. Otherwise, `null`.
  final Future<Socket> _socket;

  Map<String, dynamic> _pendingNotifications;
  Map<int, dynamic> _pendingRequests;
  Map<int, Completer<dynamic>> _pendingResponses;

  /// Pending (unread) responses from Neovim.
  Map<int, Completer<dynamic>> get pendingResponses => _pendingResponses;

  /// Pending (unhandled) requests from Neovim.
  ///
  /// These should be handled immediately, as Neovim blocks while it
  /// waits for them to be handled.
  Map<int, dynamic> get pendingRequests => _pendingRequests;

  /// Pending (unhandled) notifications from Neovim.
  ///
  /// These can/should be handled ASAP instead of immediately,
  /// since Neovim doesn't block while waiting for them to be handled.
  Map<String, dynamic> get pendingNotifications => _pendingNotifications;

  void clearPendingResponses() => _pendingResponses = {};
  void clearPendingRequests() => _pendingRequests = {};
  void clearPendingNotifications() => _pendingNotifications = {};

  /// Adds the listener for the Neovim [Socket]'s [Stream]
  /// if `listenStdout` is `false`. If `listenStdout` is `true`,
  /// adds listener for the Neovim [Process]'s stdout.
  ///
  /// Must only be called once.
  Future<void> _startListener(
      {@required listenStdin, @required listenNvimProcess}) async {
    final Function(List<int>) listener = (List<int> data) {
      final List<dynamic> msg = deserialize(data, extDecoder: ExtTypeDecoder());
      final int msgType = msg[0];
      final msgId =
          msg[1]; // Type here is `String` for notifications. Otherwise, `int`.

      // TODO(smolck): Since Neovim could respond to a command with a request
      // instead of a response, we have to check for that and complete
      // the pending response (for that command) with `null` if
      // neccessary. `_senderId - 1` will be the `msgId` of the request, and
      // it's msgType will be `0` (instead of `1` like with a response). This is
      // hacky; there's almost certainly a better way to do this.
      if (msgId == _senderId - 1 && msgType == 0) {
        _pendingResponses[_senderId - 1].complete(null);

        // TODO(smolck): Similar to the above (Neovim could respond with a
        // notification instead of a response), just a bit different since
        // notifications don't have a `msgid`. Thus, we just check if `msg` is a
        // notification and if the previous response hasn't been completed. If
        // those evaluate to `true`, then we complete the pending response to
        // `null`. This is also hacky; again, almost certainly a better way of
        // doing this.
      } else if (!_pendingResponses[_senderId - 1].isCompleted &&
          msgType == 2) {
        _pendingResponses[_senderId - 1].complete(null);
      }

      switch (_intToMsg(msgType)) {
        case Msg.Request:
          _pendingRequests[msgId] = msg[3];
          break;
        case Msg.Response:
          // Complete latest response.
          _pendingResponses.entries.last.value.complete(msg[3]);
          break;
        case Msg.Notification:
          if (msg[1] == 'redraw') {
            // Special handling for 'redraw' events.
            var messages = [];

            var eventArr = msg[2];
            for (var event in eventArr) {
              messages.add(uiEvent(event[0], event[1]));
            }

            _pendingNotifications[msgId] = messages;
            return;
          }
          _pendingNotifications[msgId] =
              msg[2]; // Notification array is shorter, so index 2 here.
          break;
      }
    };

    if (listenStdin) {
      await stdin.listen(listener);
    } else if (listenNvimProcess) {
      await _nvim
        ..stdout.listen(listener);
    } else {
      await _socket
        ..listen(listener);
    }
  }

  /// Creates a [Session] by opening a Neovim [Process] to
  /// communicate with via stdin. Default Neovim command
  /// is `nvim`.
  Session({String nvim = 'nvim'})
      : _nvim = Process.start(nvim, ['--embed']),
        _socket = null,
        _communicateStdin = false,
        _communicateNvimStdin = true {
    _pendingRequests = {};
    _pendingResponses = {};
    _pendingNotifications = {};
    _startListener(listenStdin: false, listenNvimProcess: true);
  }

  /// Creates a [Session] by communicating to a Neovim
  /// instance over the current stdin/stdout.
  ///
  /// Can be used to communicate with the running instance of
  /// Neovim which started the current script via `:jobstart`,
  /// for example.
  Session.fromCurrentStdinStdout()
      : _nvim = null,
        _socket = null,
        _communicateStdin = true,
        _communicateNvimStdin = false {
    _pendingRequests = {};
    _pendingResponses = {};
    _pendingNotifications = {};
    _startListener(listenStdin: true, listenNvimProcess: false);
  }

  /// Creates a [Session] by connecting to an already-running
  /// Neovim instance created by running `$ nvim --listen <host>:<port>`.
  /// Defaults to localhost, a.k.a. `127.0.0.1:8888`.
  Session.fromRunningInstance({
    String host = '127.0.0.1',
    int port = 8888,
  })  : _nvim = null,
        _socket = Socket.connect(host, port),
        _communicateStdin = false,
        _communicateNvimStdin = false {
    _pendingRequests = {};
    _pendingResponses = {};
    _pendingNotifications = {};
    _startListener(listenStdin: false, listenNvimProcess: false);
  }

  /// Calls a Neovim API `function`, with optional `args`.
  ///
  /// Returns response from Neovim as a [Future], which evaluates
  /// to `null` if Neovim never responds (or responds with a request
  /// or notification).
  Future<dynamic> call(String function, {List<dynamic> args}) async {
    final cmd = [
      0,
      _senderId,
      function,
      if (args != null) args else [],
    ];

    if (_communicateStdin) {
      stdout.add(serialize(cmd));
    } else if (_communicateNvimStdin) {
      await _nvim
        ..stdin.add(serialize(cmd));
    } else {
      await _socket
        ..add(serialize(cmd));
    }

    final id = _senderId++;
    _pendingResponses[id] = Completer();
    return _pendingResponses[id].future;
  }
}
