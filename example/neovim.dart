import 'package:dart_nvim_api/dart_nvim_api.dart';

main(List<String> args) async {
  // Start up Neovim instance and communicate over stdin/stdout:
  var nvim = Neovim(nvimBinaryPath: 'nvim');

  // Or connect to already running instance over TCP:
  // var nvim = Neovim.connectToRunningInstance(host: '127.0.0.1', port: 8888);

  // Run Neovim ex command.
  await nvim.command("echo 'hello'");

  // Get ex command output.
  assert(await nvim.commandOutput("echo 'hello'") == null);

  // Buffer example:
  var buf = await nvim.createBuf(true, false);
  var bufNum = await buf.getNumber(nvim);
  assert(bufNum == 2);
  assert(await nvim.getCurrentBuf() is Buffer);

  // Beyond that, you can run any Neovim api command. See `:help api-rpc` doc in Neovim.
}
