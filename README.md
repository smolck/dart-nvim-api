[![Build Status](https://travis-ci.org/smolck/dart-nvim-api.svg?branch=master)](https://travis-ci.org/smolck/dart-nvim-api)
[![Pub](https://img.shields.io/pub/v/dart_nvim_api.svg)](https://pub.dartlang.org/packages/dart_nvim_api)
# Dart Nvim API

Neovim API implementation for [Dart](dart.dev), based on and inspired by [neovim-lib](https://github.com/daa84/neovim-lib).
Still a WIP, so any feedback, contributions, etc. are greatly appreciated.

> NOTE: Dart Nvim API is still in its early stages, so there are likely to be breaking API changes.

# Example Usage
```dart
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
```
