import 'package:dart_nvim_api/dart_nvim_api.dart';

class Buffer {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Buffer(this._codeData);

  /// since: 1
  Future<int> lineCount(
    Neovim neovim,
  ) async {
    var retVal =
        await neovim.session.call("nvim_buf_line_count", args: [_codeData]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 4
  Future<bool> attach(
      Neovim neovim, bool send_buffer, Map<dynamic, dynamic> opts) async {
    var retVal = await neovim.session
        .call("nvim_buf_attach", args: [_codeData, send_buffer, opts]);

    retVal = retVal as bool;

    return retVal;
  }

  /// since: 4
  Future<bool> detach(
    Neovim neovim,
  ) async {
    var retVal =
        await neovim.session.call("nvim_buf_detach", args: [_codeData]);

    retVal = retVal as bool;

    return retVal;
  }

  /// since: 1
  Future<List<String>> getLines(
      Neovim neovim, int start, int end, bool strict_indexing) async {
    var retVal = await neovim.session.call("nvim_buf_get_lines",
        args: [_codeData, start, end, strict_indexing]);

    retVal = List<String>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<void> setLines(Neovim neovim, int start, int end, bool strict_indexing,
      List<String> replacement) async {
    var retVal = await neovim.session.call("nvim_buf_set_lines",
        args: [_codeData, start, end, strict_indexing, replacement]);

    return retVal;
  }

  /// since: 5
  Future<int> getOffset(Neovim neovim, int index) async {
    var retVal = await neovim.session
        .call("nvim_buf_get_offset", args: [_codeData, index]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) async {
    var retVal =
        await neovim.session.call("nvim_buf_get_var", args: [_codeData, name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 2
  Future<int> getChangedtick(
    Neovim neovim,
  ) async {
    var retVal = await neovim.session
        .call("nvim_buf_get_changedtick", args: [_codeData]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> getKeymap(
      Neovim neovim, String mode) async {
    var retVal = await neovim.session
        .call("nvim_buf_get_keymap", args: [_codeData, mode]);

    retVal = List<Map<dynamic, dynamic>>.from(retVal);

    return retVal;
  }

  /// since: 6
  Future<void> setKeymap(Neovim neovim, String mode, String lhs, String rhs,
      Map<dynamic, dynamic> opts) async {
    var retVal = await neovim.session
        .call("nvim_buf_set_keymap", args: [_codeData, mode, lhs, rhs, opts]);

    return retVal;
  }

  /// since: 6
  Future<void> delKeymap(Neovim neovim, String mode, String lhs) async {
    var retVal = await neovim.session
        .call("nvim_buf_del_keymap", args: [_codeData, mode, lhs]);

    return retVal;
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> getCommands(
      Neovim neovim, Map<dynamic, dynamic> opts) async {
    var retVal = await neovim.session
        .call("nvim_buf_get_commands", args: [_codeData, opts]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) async {
    var retVal = await neovim.session
        .call("nvim_buf_set_var", args: [_codeData, name, value]);

    return retVal;
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) async {
    var retVal =
        await neovim.session.call("nvim_buf_del_var", args: [_codeData, name]);

    return retVal;
  }

  /// since: 1
  Future<dynamic> getOption(Neovim neovim, String name) async {
    var retVal = await neovim.session
        .call("nvim_buf_get_option", args: [_codeData, name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<void> setOption(Neovim neovim, String name, dynamic value) async {
    var retVal = await neovim.session
        .call("nvim_buf_set_option", args: [_codeData, name, value]);

    return retVal;
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) async {
    var retVal =
        await neovim.session.call("nvim_buf_get_number", args: [_codeData]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<String> getName(
    Neovim neovim,
  ) async {
    var retVal =
        await neovim.session.call("nvim_buf_get_name", args: [_codeData]);

    retVal = retVal as String;

    return retVal;
  }

  /// since: 1
  Future<void> setName(Neovim neovim, String name) async {
    var retVal =
        await neovim.session.call("nvim_buf_set_name", args: [_codeData, name]);

    return retVal;
  }

  /// since: 5
  Future<bool> isLoaded(
    Neovim neovim,
  ) async {
    var retVal =
        await neovim.session.call("nvim_buf_is_loaded", args: [_codeData]);

    retVal = retVal as bool;

    return retVal;
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) async {
    var retVal =
        await neovim.session.call("nvim_buf_is_valid", args: [_codeData]);

    retVal = retVal as bool;

    return retVal;
  }

  /// since: 1
  Future<List<int>> getMark(Neovim neovim, String name) async {
    var retVal =
        await neovim.session.call("nvim_buf_get_mark", args: [_codeData, name]);

    retVal = List<int>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<int> addHighlight(Neovim neovim, int ns_id, String hl_group, int line,
      int col_start, int col_end) async {
    var retVal = await neovim.session.call("nvim_buf_add_highlight",
        args: [_codeData, ns_id, hl_group, line, col_start, col_end]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 5
  Future<void> clearNamespace(
      Neovim neovim, int ns_id, int line_start, int line_end) async {
    var retVal = await neovim.session.call("nvim_buf_clear_namespace",
        args: [_codeData, ns_id, line_start, line_end]);

    return retVal;
  }

  /// since: 1
  Future<void> clearHighlight(
      Neovim neovim, int ns_id, int line_start, int line_end) async {
    var retVal = await neovim.session.call("nvim_buf_clear_highlight",
        args: [_codeData, ns_id, line_start, line_end]);

    return retVal;
  }

  /// since: 5
  Future<int> setVirtualText(Neovim neovim, int ns_id, int line,
      List<dynamic> chunks, Map<dynamic, dynamic> opts) async {
    var retVal = await neovim.session.call("nvim_buf_set_virtual_text",
        args: [_codeData, ns_id, line, chunks, opts]);

    retVal = retVal as int;

    return retVal;
  }
}
