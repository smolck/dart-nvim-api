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
- Changes
    - Moved `Neovim` class from `lib/dart_nvim_api.dart` to `lib/src/neovim.dart`
        to be more consistent with idiomatic Dart library structure.
    - Updated README to show latest library version from [pub.dev](http://pub.dev).
