import 'dart:io';

import 'package:dart_nvim_api/dart_nvim_api.dart';
import 'package:test/test.dart';

void main() async {
  await sessionCommunicatesOverStdin();
  // await sessionConnectsToRunningInstance();
}

void sessionCommunicatesOverStdin() async {
  final sessionOverStdin = Session();

  final response = await sessionOverStdin
      .call('nvim_command', args: ['echo "Hello, World!"']);

  test('session communicates over stdin', () {
    assert(response == null);
  });
}

void sessionConnectsToRunningInstance() async {
  // TODO(smolck): Doesn't work.
  final _ = Process.start('nvim', ['--listen 127.0.0.1:8000']);

  final session = Session.fromRunningInstance(host: '127.0.0.1', port: 8000);

  final response =
      await session.call('nvim_command', args: ['echo "Hello, World!"']);

  test(
      'session successfully connects and communicates with a running Neovim' +
      'instance', () {
    assert(response == null);

    // Close out Neovim.
    session.call('nvim_command', args: ['qa!']);
  });

}
