import 'package:dart_nvim_api/dart_nvim_api.dart';

class Tabpage {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Tabpage(this._codeData);

  /// since: 1
  Future<List<Window>> tabpageListWins(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_list_wins", args: [_codeData]);
  }

  /// since: 1
  Future<dynamic> tabpageGetVar(Neovim neovim, String name) {
    return neovim.session.call("nvim_tabpage_get_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> tabpageSetVar(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_tabpage_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> tabpageDelVar(Neovim neovim, String name) {
    return neovim.session.call("nvim_tabpage_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<Window> tabpageGetWin(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_get_win", args: [_codeData]);
  }

  /// since: 1
  Future<int> tabpageGetNumber(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<bool> tabpageIsValid(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_is_valid", args: [_codeData]);
  }
}
