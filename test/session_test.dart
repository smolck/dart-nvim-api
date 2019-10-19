import 'dart:io';

import 'package:dart_nvim_api/dart_nvim_api.dart';
import 'package:test/test.dart';

void main() {
  sessionCommunicatesOverStdin();
}

void sessionCommunicatesOverStdin() async {
  final sessionOverStdin = Session();

  final response =
      await sessionOverStdin.editor_command('echo "Hello, World!"');

  test('session communicates over stdin', () {
    assert(response == [1, 5, null, null]);
  });
}

void sessionConnectsToRunningInstance() async {
  final _ = Process.start('nvim', ['--listen 127.0.0.1:8000']);
  final session = Session.fromRunningInstance(host: '127.0.0.1', port: 8000);

  final response = await session.editor_command('echo "Hello, World!"');

  test(
      'session successfully connects and communicates with a running Neovim'
      'instance', () {
    assert(response == [1, 5, null, null]);
  });

  // Close out Neovim (likely unneccessary).
  await session.editor_command('qa!');
}
