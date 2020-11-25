import 'package:dart_nvim_api/dart_nvim_api.dart';

void main(List<String> args) async {
  // Start up Neovim instance, with optional `onNotify` and `onRequest`
  // callbacks.
  // See also Nvim.child()
  var nvim = await Nvim.spawn();

  // Run Neovim ex command.
  await nvim.command("echo 'hello'");

  // Get ex command output.

  assert(await nvim.exec('echo 1 + 1', true) == '2');

  // Buffer example:
  var buf = await nvim.createBuf(true, false);
  var bufNameWithoutPath = 'some name';
  await nvim.bufSetName(buf, bufNameWithoutPath);
  var bufName = await nvim.bufGetName(buf);
  assert(bufName.contains(bufNameWithoutPath));

  // Kill Neovim when done.
  nvim.kill();
}
