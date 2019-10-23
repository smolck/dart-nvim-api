import 'package:dart_nvim_api/dart_nvim_api.dart';

class Window {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Window(this._codeData);

  /// since: 1
  Future<Buffer> winGetBuf(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_buf", args: [_codeData]);
  }

  /// since: 5
  Future<void> winSetBuf(Neovim neovim, Buffer buffer) {
    return neovim.session.call("nvim_win_set_buf", args: [_codeData, buffer]);
  }

  /// since: 1
  Future<List<int>> winGetCursor(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_cursor", args: [_codeData]);
  }

  /// since: 1
  Future<void> winSetCursor(Neovim neovim, List<int> pos) {
    return neovim.session.call("nvim_win_set_cursor", args: [_codeData, pos]);
  }

  /// since: 1
  Future<int> winGetHeight(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_height", args: [_codeData]);
  }

  /// since: 1
  Future<void> winSetHeight(Neovim neovim, int height) {
    return neovim.session
        .call("nvim_win_set_height", args: [_codeData, height]);
  }

  /// since: 1
  Future<int> winGetWidth(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_width", args: [_codeData]);
  }

  /// since: 1
  Future<void> winSetWidth(Neovim neovim, int width) {
    return neovim.session.call("nvim_win_set_width", args: [_codeData, width]);
  }

  /// since: 1
  Future<dynamic> winGetVar(Neovim neovim, String name) {
    return neovim.session.call("nvim_win_get_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> winSetVar(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_win_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> winDelVar(Neovim neovim, String name) {
    return neovim.session.call("nvim_win_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> winGetOption(Neovim neovim, String name) {
    return neovim.session.call("nvim_win_get_option", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> winSetOption(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_win_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<List<int>> winGetPosition(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_position", args: [_codeData]);
  }

  /// since: 1
  Future<Tabpage> winGetTabpage(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_tabpage", args: [_codeData]);
  }

  /// since: 1
  Future<int> winGetNumber(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<bool> winIsValid(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_is_valid", args: [_codeData]);
  }

  /// since: 6
  Future<void> winSetConfig(Neovim neovim, Map<dynamic, dynamic> config) {
    return neovim.session
        .call("nvim_win_set_config", args: [_codeData, config]);
  }

  /// since: 6
  Future<Map<dynamic, dynamic>> winGetConfig(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_config", args: [_codeData]);
  }

  /// since: 6
  Future<void> winClose(Neovim neovim, bool force) {
    return neovim.session.call("nvim_win_close", args: [_codeData, force]);
  }
}
