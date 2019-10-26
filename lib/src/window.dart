import 'package:dart_nvim_api/dart_nvim_api.dart';

class Window {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Window(this._codeData);

  /// since: 1
  Future<Buffer> getBuf(
    Neovim neovim,
  ) async {
    neovim.session.call<Buffer>("nvim_win_get_buf", args: [_codeData]);
  }

  /// since: 5
  Future<void> setBuf(Neovim neovim, Buffer buffer) async {
    neovim.session.call<void>("nvim_win_set_buf", args: [_codeData, buffer]);
  }

  /// since: 1
  Future<List<int>> getCursor(
    Neovim neovim,
  ) async {
    neovim.session.call<List<int>>("nvim_win_get_cursor", args: [_codeData]);
  }

  /// since: 1
  Future<void> setCursor(Neovim neovim, List<int> pos) async {
    neovim.session.call<void>("nvim_win_set_cursor", args: [_codeData, pos]);
  }

  /// since: 1
  Future<int> getHeight(
    Neovim neovim,
  ) async {
    neovim.session.call<int>("nvim_win_get_height", args: [_codeData]);
  }

  /// since: 1
  Future<void> setHeight(Neovim neovim, int height) async {
    neovim.session.call<void>("nvim_win_set_height", args: [_codeData, height]);
  }

  /// since: 1
  Future<int> getWidth(
    Neovim neovim,
  ) async {
    neovim.session.call<int>("nvim_win_get_width", args: [_codeData]);
  }

  /// since: 1
  Future<void> setWidth(Neovim neovim, int width) async {
    neovim.session.call<void>("nvim_win_set_width", args: [_codeData, width]);
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) async {
    neovim.session.call<dynamic>("nvim_win_get_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) async {
    neovim.session
        .call<void>("nvim_win_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) async {
    neovim.session.call<void>("nvim_win_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> getOption(Neovim neovim, String name) async {
    neovim.session
        .call<dynamic>("nvim_win_get_option", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> setOption(Neovim neovim, String name, dynamic value) async {
    neovim.session
        .call<void>("nvim_win_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<List<int>> getPosition(
    Neovim neovim,
  ) async {
    neovim.session.call<List<int>>("nvim_win_get_position", args: [_codeData]);
  }

  /// since: 1
  Future<Tabpage> getTabpage(
    Neovim neovim,
  ) async {
    neovim.session.call<Tabpage>("nvim_win_get_tabpage", args: [_codeData]);
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) async {
    neovim.session.call<int>("nvim_win_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) async {
    neovim.session.call<bool>("nvim_win_is_valid", args: [_codeData]);
  }

  /// since: 6
  Future<void> setConfig(Neovim neovim, Map<dynamic, dynamic> config) async {
    neovim.session.call<void>("nvim_win_set_config", args: [_codeData, config]);
  }

  /// since: 6
  Future<Map<dynamic, dynamic>> getConfig(
    Neovim neovim,
  ) async {
    neovim.session
        .call<Map<dynamic, dynamic>>("nvim_win_get_config", args: [_codeData]);
  }

  /// since: 6
  Future<void> close(Neovim neovim, bool force) async {
    neovim.session.call<void>("nvim_win_close", args: [_codeData, force]);
  }
}
