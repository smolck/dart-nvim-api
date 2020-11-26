## 0.1.0

- Initial version

## 0.1.1

- Make function names for the `Buffer`, `Tabpage`, and `Window` classes
    camelcase.
- Fix an issue where API functions which were supposed to return
    a `Buffer`, `Tabpage`, or `Window` would return `null` instead.
    
## 0.1.2

- Additions
    - `attachUi` function in the `Neovim` class for attaching an external
        UI to Neovim.
    - Travis.
    - Documentation for `Neovim` class (not finished yet, mainly waiting on [neovim/neovim#1139](https://github.com/neovim/neovim/pull/11396) and a subsequent PR adding a way to get
        the documentation on each API function from Neovim).
    - Classes for each type of `ui_event` from Neovim.
    - `example` directory with a short example (shown in README).
- Changes
    - Moved `Neovim` class from `lib/dart_nvim_api.dart` to `lib/src/neovim.dart`
        to be more consistent with idiomatic Dart library structure.
    - Updated README to show latest library version from [pub.dev](http://pub.dev)

## 0.1.3

- Added `Session.fromCurrentStdinStdout()` function and an optional flag
    (`communicateWithParentProcess`) to the `Neovim` class (see docs for more
    info).

## 0.1.4

- Fixed an issue where functions which returned `List`s (e.g.
    `Buffer().getLines` would throw an error saying `type 'List<dynamic>'
    is not a subtype of type 'List<String>' in type cast` or similar.

## 0.2.0

- `Neovim` class has been renamed to `Nvim`
- Neovim instance is spawned via `await Nvim.spawn()`
- Now a Neovim instance that communicates to Neovim via current stdin/stdout is gotten with `await Nvim.child()`
- Buffer/Window/Tabpage APIs are within the Nvim API, so `await nvim.bufGetName(buf)` 
  is used instead of `await buf.getName()`, and likewise for the window and
  tabpage APIs.
- More/better tests
- Various internal changes

## 0.2.1

- Errors from Neovim when calling API functions are now forwarded to the caller
  via exceptions.

## 0.2.2

- Add way to override onNotify and onRequest handlers after initialization of
  `Nvim`
