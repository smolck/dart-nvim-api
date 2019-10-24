import 'package:dart_nvim_api/dart_nvim_api.dart';

class Window {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Window(this._codeData);

  /// since: 1
  Future<Buffer> getBuf(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_buf", args: [_codeData]);

    retVal = retVal as Buffer;

    return retVal;
  }

  /// since: 5
  Future<void> setBuf(Neovim neovim, Buffer buffer) {
    var retVal =
        neovim.session.call("nvim_win_set_buf", args: [_codeData, buffer]);

    return retVal;
  }

  /// since: 1
  Future<List<int>> getCursor(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_cursor", args: [_codeData]);

    retVal = List<int>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<void> setCursor(Neovim neovim, List<int> pos) {
    var retVal =
        neovim.session.call("nvim_win_set_cursor", args: [_codeData, pos]);

    return retVal;
  }

  /// since: 1
  Future<int> getHeight(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_height", args: [_codeData]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<void> setHeight(Neovim neovim, int height) {
    var retVal =
        neovim.session.call("nvim_win_set_height", args: [_codeData, height]);

    return retVal;
  }

  /// since: 1
  Future<int> getWidth(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_width", args: [_codeData]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<void> setWidth(Neovim neovim, int width) {
    var retVal =
        neovim.session.call("nvim_win_set_width", args: [_codeData, width]);

    return retVal;
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) {
    var retVal =
        neovim.session.call("nvim_win_get_var", args: [_codeData, name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) {
    var retVal =
        neovim.session.call("nvim_win_set_var", args: [_codeData, name, value]);

    return retVal;
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) {
    var retVal =
        neovim.session.call("nvim_win_del_var", args: [_codeData, name]);

    return retVal;
  }

  /// since: 1
  Future<dynamic> getOption(Neovim neovim, String name) {
    var retVal =
        neovim.session.call("nvim_win_get_option", args: [_codeData, name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<void> setOption(Neovim neovim, String name, dynamic value) {
    var retVal = neovim.session
        .call("nvim_win_set_option", args: [_codeData, name, value]);

    return retVal;
  }

  /// since: 1
  Future<List<int>> getPosition(
    Neovim neovim,
  ) {
    var retVal =
        neovim.session.call("nvim_win_get_position", args: [_codeData]);

    retVal = List<int>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<Tabpage> getTabpage(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_tabpage", args: [_codeData]);

    retVal = retVal as Tabpage;

    return retVal;
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_number", args: [_codeData]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_is_valid", args: [_codeData]);

    retVal = retVal as bool;

    return retVal;
  }

  /// since: 6
  Future<void> setConfig(Neovim neovim, Map<dynamic, dynamic> config) {
    var retVal =
        neovim.session.call("nvim_win_set_config", args: [_codeData, config]);

    return retVal;
  }

  /// since: 6
  Future<Map<dynamic, dynamic>> getConfig(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_win_get_config", args: [_codeData]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 6
  Future<void> close(Neovim neovim, bool force) {
    var retVal =
        neovim.session.call("nvim_win_close", args: [_codeData, force]);

    return retVal;
  }
}
