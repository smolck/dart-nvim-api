import 'package:dart_nvim_api/dart_nvim_api.dart';

class Buffer {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Buffer(this._codeData);

  /// since: 1
  Future<int> bufLineCount(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_line_count", args: [_codeData]);
  }

  /// since: 4
  Future<bool> bufAttach(
      Neovim neovim, bool send_buffer, Map<dynamic, dynamic> opts) {
    return neovim.session
        .call("nvim_buf_attach", args: [_codeData, send_buffer, opts]);
  }

  /// since: 4
  Future<bool> bufDetach(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_detach", args: [_codeData]);
  }

  /// since: 1
  Future<List<String>> bufGetLines(
      Neovim neovim, int start, int end, bool strict_indexing) {
    return neovim.session.call("nvim_buf_get_lines",
        args: [_codeData, start, end, strict_indexing]);
  }

  /// since: 1
  Future<void> bufSetLines(Neovim neovim, int start, int end,
      bool strict_indexing, List<String> replacement) {
    return neovim.session.call("nvim_buf_set_lines",
        args: [_codeData, start, end, strict_indexing, replacement]);
  }

  /// since: 5
  Future<int> bufGetOffset(Neovim neovim, int index) {
    return neovim.session.call("nvim_buf_get_offset", args: [_codeData, index]);
  }

  /// since: 1
  Future<dynamic> bufGetVar(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_get_var", args: [_codeData, name]);
  }

  /// since: 2
  Future<int> bufGetChangedtick(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_get_changedtick", args: [_codeData]);
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> bufGetKeymap(Neovim neovim, String mode) {
    return neovim.session.call("nvim_buf_get_keymap", args: [_codeData, mode]);
  }

  /// since: 6
  Future<void> bufSetKeymap(Neovim neovim, String mode, String lhs, String rhs,
      Map<dynamic, dynamic> opts) {
    return neovim.session
        .call("nvim_buf_set_keymap", args: [_codeData, mode, lhs, rhs, opts]);
  }

  /// since: 6
  Future<void> bufDelKeymap(Neovim neovim, String mode, String lhs) {
    return neovim.session
        .call("nvim_buf_del_keymap", args: [_codeData, mode, lhs]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> bufGetCommands(
      Neovim neovim, Map<dynamic, dynamic> opts) {
    return neovim.session
        .call("nvim_buf_get_commands", args: [_codeData, opts]);
  }

  /// since: 1
  Future<void> bufSetVar(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_buf_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> bufDelVar(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> bufGetOption(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_get_option", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> bufSetOption(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_buf_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<int> bufGetNumber(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<String> bufGetName(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_get_name", args: [_codeData]);
  }

  /// since: 1
  Future<void> bufSetName(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_set_name", args: [_codeData, name]);
  }

  /// since: 5
  Future<bool> bufIsLoaded(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_is_loaded", args: [_codeData]);
  }

  /// since: 1
  Future<bool> bufIsValid(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_is_valid", args: [_codeData]);
  }

  /// since: 1
  Future<List<int>> bufGetMark(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_get_mark", args: [_codeData, name]);
  }

  /// since: 1
  Future<int> bufAddHighlight(Neovim neovim, int ns_id, String hl_group,
      int line, int col_start, int col_end) {
    return neovim.session.call("nvim_buf_add_highlight",
        args: [_codeData, ns_id, hl_group, line, col_start, col_end]);
  }

  /// since: 5
  Future<void> bufClearNamespace(
      Neovim neovim, int ns_id, int line_start, int line_end) {
    return neovim.session.call("nvim_buf_clear_namespace",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 1
  Future<void> bufClearHighlight(
      Neovim neovim, int ns_id, int line_start, int line_end) {
    return neovim.session.call("nvim_buf_clear_highlight",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 5
  Future<int> bufSetVirtualText(Neovim neovim, int ns_id, int line,
      List<dynamic> chunks, Map<dynamic, dynamic> opts) {
    return neovim.session.call("nvim_buf_set_virtual_text",
        args: [_codeData, ns_id, line, chunks, opts]);
  }
}
