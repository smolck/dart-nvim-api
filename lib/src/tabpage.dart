import 'package:dart_nvim_api/dart_nvim_api.dart';

class Tabpage {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Tabpage(this._codeData);

  /// since: 1
  Future<List<Window>> listWins(
    Neovim neovim,
  ) {
    var retVal =
        neovim.session.call("nvim_tabpage_list_wins", args: [_codeData]);

    retVal = List<Window>.from(retVal);
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) {
    var retVal =
        neovim.session.call("nvim_tabpage_get_var", args: [_codeData, name]);

    retVal = retVal as dynamic;
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) {
    var retVal = neovim.session
        .call("nvim_tabpage_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) {
    var retVal =
        neovim.session.call("nvim_tabpage_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<Window> getWin(
    Neovim neovim,
  ) {
    var retVal = neovim.session.call("nvim_tabpage_get_win", args: [_codeData]);

    retVal = retVal as Window;
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) {
    var retVal =
        neovim.session.call("nvim_tabpage_get_number", args: [_codeData]);

    retVal = retVal as int;
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) {
    var retVal =
        neovim.session.call("nvim_tabpage_is_valid", args: [_codeData]);

    retVal = retVal as bool;
  }
}
