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
    return neovim.session.call("nvim_buf_line_count",
        args: [_codeData]).then<int>((v) => v as int);
  }

  /// since: 4
  Future<bool> attach(
      Neovim neovim, bool send_buffer, Map<dynamic, dynamic> opts) async {
    return neovim.session.call("nvim_buf_attach",
        args: [_codeData, send_buffer, opts]).then<bool>((v) => v as bool);
  }

  /// since: 4
  Future<bool> detach(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_buf_detach",
        args: [_codeData]).then<bool>((v) => v as bool);
  }

  /// since: 1
  Future<List<String>> getLines(
      Neovim neovim, int start, int end, bool strict_indexing) async {
    return neovim.session.call("nvim_buf_get_lines", args: [
      _codeData,
      start,
      end,
      strict_indexing
    ]).then<List<String>>((v) => (v as List).cast<String>());
  }

  /// since: 1
  Future<void> setLines(Neovim neovim, int start, int end, bool strict_indexing,
      List<String> replacement) async {
    return neovim.session.call("nvim_buf_set_lines",
        args: [_codeData, start, end, strict_indexing, replacement]);
  }

  /// since: 5
  Future<int> getOffset(Neovim neovim, int index) async {
    return neovim.session.call("nvim_buf_get_offset",
        args: [_codeData, index]).then<int>((v) => v as int);
  }

  /// since: 1
  Future<dynamic> getVar(Neovim neovim, String name) async {
    return neovim.session.call("nvim_buf_get_var",
        args: [_codeData, name]).then<dynamic>((v) => v as dynamic);
  }

  /// since: 2
  Future<int> getChangedtick(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_buf_get_changedtick",
        args: [_codeData]).then<int>((v) => v as int);
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> getKeymap(
      Neovim neovim, String mode) async {
    return neovim.session.call("nvim_buf_get_keymap", args: [
      _codeData,
      mode
    ]).then<List<Map<dynamic, dynamic>>>(
        (v) => (v as List).cast<Map<dynamic, dynamic>>());
  }

  /// since: 6
  Future<void> setKeymap(Neovim neovim, String mode, String lhs, String rhs,
      Map<dynamic, dynamic> opts) async {
    return neovim.session
        .call("nvim_buf_set_keymap", args: [_codeData, mode, lhs, rhs, opts]);
  }

  /// since: 6
  Future<void> delKeymap(Neovim neovim, String mode, String lhs) async {
    return neovim.session
        .call("nvim_buf_del_keymap", args: [_codeData, mode, lhs]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> getCommands(
      Neovim neovim, Map<dynamic, dynamic> opts) async {
    return neovim.session.call("nvim_buf_get_commands", args: [
      _codeData,
      opts
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  /// since: 1
  Future<void> setVar(Neovim neovim, String name, dynamic value) async {
    return neovim.session
        .call("nvim_buf_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> delVar(Neovim neovim, String name) async {
    return neovim.session.call("nvim_buf_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> getOption(Neovim neovim, String name) async {
    return neovim.session.call("nvim_buf_get_option",
        args: [_codeData, name]).then<dynamic>((v) => v as dynamic);
  }

  /// since: 1
  Future<void> setOption(Neovim neovim, String name, dynamic value) async {
    return neovim.session
        .call("nvim_buf_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<int> getNumber(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_buf_get_number",
        args: [_codeData]).then<int>((v) => v as int);
  }

  /// since: 1
  Future<String> getName(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_buf_get_name",
        args: [_codeData]).then<String>((v) => v as String);
  }

  /// since: 1
  Future<void> setName(Neovim neovim, String name) async {
    return neovim.session.call("nvim_buf_set_name", args: [_codeData, name]);
  }

  /// since: 5
  Future<bool> isLoaded(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_buf_is_loaded",
        args: [_codeData]).then<bool>((v) => v as bool);
  }

  /// since: 1
  Future<bool> isValid(
    Neovim neovim,
  ) async {
    return neovim.session.call("nvim_buf_is_valid",
        args: [_codeData]).then<bool>((v) => v as bool);
  }

  /// since: 1
  Future<List<int>> getMark(Neovim neovim, String name) async {
    return neovim.session.call("nvim_buf_get_mark", args: [
      _codeData,
      name
    ]).then<List<int>>((v) => (v as List).cast<int>());
  }

  /// since: 7
  Future<List<int>> getExtmarkById(Neovim neovim, int ns_id, int id) async {
    return neovim.session.call("nvim_buf_get_extmark_by_id", args: [
      _codeData,
      ns_id,
      id
    ]).then<List<int>>((v) => (v as List).cast<int>());
  }

  /// since: 7
  Future<List<dynamic>> getExtmarks(Neovim neovim, int ns_id, dynamic start,
      dynamic end, Map<dynamic, dynamic> opts) async {
    return neovim.session.call("nvim_buf_get_extmarks", args: [
      _codeData,
      ns_id,
      start,
      end,
      opts
    ]).then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  /// since: 7
  Future<int> setExtmark(Neovim neovim, int ns_id, int id, int line, int col,
      Map<dynamic, dynamic> opts) async {
    return neovim.session.call("nvim_buf_set_extmark", args: [
      _codeData,
      ns_id,
      id,
      line,
      col,
      opts
    ]).then<int>((v) => v as int);
  }

  /// since: 7
  Future<bool> delExtmark(Neovim neovim, int ns_id, int id) async {
    return neovim.session.call("nvim_buf_del_extmark",
        args: [_codeData, ns_id, id]).then<bool>((v) => v as bool);
  }

  /// since: 1
  Future<int> addHighlight(Neovim neovim, int ns_id, String hl_group, int line,
      int col_start, int col_end) async {
    return neovim.session.call("nvim_buf_add_highlight", args: [
      _codeData,
      ns_id,
      hl_group,
      line,
      col_start,
      col_end
    ]).then<int>((v) => v as int);
  }

  /// since: 5
  Future<void> clearNamespace(
      Neovim neovim, int ns_id, int line_start, int line_end) async {
    return neovim.session.call("nvim_buf_clear_namespace",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 1
  Future<void> clearHighlight(
      Neovim neovim, int ns_id, int line_start, int line_end) async {
    return neovim.session.call("nvim_buf_clear_highlight",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 5
  Future<int> setVirtualText(Neovim neovim, int ns_id, int line,
      List<dynamic> chunks, Map<dynamic, dynamic> opts) async {
    return neovim.session.call("nvim_buf_set_virtual_text", args: [
      _codeData,
      ns_id,
      line,
      chunks,
      opts
    ]).then<int>((v) => v as int);
  }

  /// since: 7
  Future<List<dynamic>> getVirtualText(Neovim neovim, int lnum) async {
    return neovim.session.call("nvim_buf_get_virtual_text", args: [
      _codeData,
      lnum
    ]).then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }
}
