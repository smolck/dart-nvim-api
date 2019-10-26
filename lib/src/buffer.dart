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
    return neovim.session.call<int>("nvim_buf_line_count", args: [_codeData]);
  }

  /// since: 4
  Future<bool> attach(
      Neovim neovim, bool send_buffer, Map<dynamic, dynamic> opts) async {
    return neovim.session
        .call<bool>("nvim_buf_attach", args: [_codeData, send_buffer, opts]);
  }

  /// since: 4
  Future<bool> detach(
    Neovim neovim,
  ) async {
    return neovim.session.call<bool>("nvim_buf_detach", args: [_codeData]);
  }

  /// since: 1
  Future<List<String>> getLines(
      Neovim neovim, int start, int end, bool strict_indexing) async {
    return neovim.session.call<List<String>>("nvim_buf_get_lines",
        args: [_codeData, start, end, strict_indexing]);
  }

  /// since: 1
  Future<void> setLines(Neovim neovim, int start, int end, bool strict_indexing,
      List<String> replacement) async {
    return neovim.session.call<void>("nvim_buf_set_lines",
        args: [_codeData, start, end, strict_indexing, replacement]);
  }

  /// since: 5
  Future<int> getOffset(Neovim neovim, int index) async {
    return neovim.session
        .call<int>("nvim_buf_get_offset", args: [_codeData, index]);
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) async {
    return neovim.session
        .call<dynamic>("nvim_buf_get_var", args: [_codeData, name]);
  }

  /// since: 2
  Future<int> getChangedtick(
    Neovim neovim,
  ) async {
    return neovim.session
        .call<int>("nvim_buf_get_changedtick", args: [_codeData]);
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> getKeymap(
      Neovim neovim, String mode) async {
    return neovim.session.call<List<Map<dynamic, dynamic>>>(
        "nvim_buf_get_keymap",
        args: [_codeData, mode]);
  }

  /// since: 6
  Future<void> setKeymap(Neovim neovim, String mode, String lhs, String rhs,
      Map<dynamic, dynamic> opts) async {
    return neovim.session.call<void>("nvim_buf_set_keymap",
        args: [_codeData, mode, lhs, rhs, opts]);
  }

  /// since: 6
  Future<void> delKeymap(Neovim neovim, String mode, String lhs) async {
    return neovim.session
        .call<void>("nvim_buf_del_keymap", args: [_codeData, mode, lhs]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> getCommands(
      Neovim neovim, Map<dynamic, dynamic> opts) async {
    return neovim.session.call<Map<dynamic, dynamic>>("nvim_buf_get_commands",
        args: [_codeData, opts]);
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) async {
    return neovim.session
        .call<void>("nvim_buf_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) async {
    return neovim.session
        .call<void>("nvim_buf_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> getOption(Neovim neovim, String name) async {
    return neovim.session
        .call<dynamic>("nvim_buf_get_option", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> setOption(Neovim neovim, String name, dynamic value) async {
    return neovim.session
        .call<void>("nvim_buf_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) async {
    return neovim.session.call<int>("nvim_buf_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<String> getName(
    Neovim neovim,
  ) async {
    return neovim.session.call<String>("nvim_buf_get_name", args: [_codeData]);
  }

  /// since: 1
  Future<void> setName(Neovim neovim, String name) async {
    return neovim.session
        .call<void>("nvim_buf_set_name", args: [_codeData, name]);
  }

  /// since: 5
  Future<bool> isLoaded(
    Neovim neovim,
  ) async {
    return neovim.session.call<bool>("nvim_buf_is_loaded", args: [_codeData]);
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) async {
    return neovim.session.call<bool>("nvim_buf_is_valid", args: [_codeData]);
  }

  /// since: 1
  Future<List<int>> getMark(Neovim neovim, String name) async {
    return neovim.session
        .call<List<int>>("nvim_buf_get_mark", args: [_codeData, name]);
  }

  /// since: 1
  Future<int> addHighlight(Neovim neovim, int ns_id, String hl_group, int line,
      int col_start, int col_end) async {
    return neovim.session.call<int>("nvim_buf_add_highlight",
        args: [_codeData, ns_id, hl_group, line, col_start, col_end]);
  }

  /// since: 5
  Future<void> clearNamespace(
      Neovim neovim, int ns_id, int line_start, int line_end) async {
    return neovim.session.call<void>("nvim_buf_clear_namespace",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 1
  Future<void> clearHighlight(
      Neovim neovim, int ns_id, int line_start, int line_end) async {
    return neovim.session.call<void>("nvim_buf_clear_highlight",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 5
  Future<int> setVirtualText(Neovim neovim, int ns_id, int line,
      List<dynamic> chunks, Map<dynamic, dynamic> opts) async {
    return neovim.session.call<int>("nvim_buf_set_virtual_text",
        args: [_codeData, ns_id, line, chunks, opts]);
  }
}
