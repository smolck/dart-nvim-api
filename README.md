# Dart Nvim API
Neovim API implementation for [Dart](dart.dev), based on and inspired by [neovim-lib](https://github.com/daa84/neovim-lib).
Still a WIP, so any feedback, contributions, etc. are greatly appreciated.

__NOTE__: Currently, this library
only supports _asynchronous_ calls to Neovim. This is due to how
Dart's [`Socket` class](https://api.dartlang.org/stable/2.5.2/dart-io/Socket-class.html) (used
internally by the `Session` class here), is best used with `async/await`. However,
I do plan to (attempt) creating a blocking implementation, so feel free to open an issue
on the topic if you have any suggestsions or want to help.
