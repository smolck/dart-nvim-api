import 'package:dart_nvim_api/dart_nvim_api.dart';

class Tabpage {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Tabpage(this._codeData);

  /// since: 1
  Future<List<Window>> listWins(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_tabpage_list_wins", args: [
      _codeData
    ]).then<List<Window>>((v) => (v as List).cast<Window>());
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) async {
    return neovim.session.call("nvim_tabpage_get_var",
        args: [_codeData, name]).then<dynamic>((v) => v as dynamic);
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) async {
    return neovim.session
        .call("nvim_tabpage_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) async {
    return neovim.session.call("nvim_tabpage_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<Window> getWin(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_tabpage_get_win",
        args: [_codeData]).then<Window>((v) => v as Window);
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_tabpage_get_number",
        args: [_codeData]).then<int>((v) => v as int);
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_tabpage_is_valid",
        args: [_codeData]).then<bool>((v) => v as bool);
  }
}
