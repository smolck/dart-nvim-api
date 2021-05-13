import '../neovim.dart';
import '../ext_types.dart';

extension NvimBufferApi on Nvim {
  Future<int> bufLineCount(Buffer buffer) {
    return call('nvim_buf_line_count', args: [
      buffer,
    ]).then<int>((v) => v as int);
  }

  Future<bool> bufAttach(
      Buffer buffer, bool send_buffer, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_attach', args: [
      buffer,
      send_buffer,
      opts,
    ]).then<bool>((v) => v as bool);
  }

  Future<bool> bufDetach(Buffer buffer) {
    return call('nvim_buf_detach', args: [
      buffer,
    ]).then<bool>((v) => v as bool);
  }

  Future<List<String>> bufGetLines(
      Buffer buffer, int start, int end, bool strict_indexing) {
    return call('nvim_buf_get_lines', args: [
      buffer,
      start,
      end,
      strict_indexing,
    ]).then<List<String>>((v) => (v as List).cast<String>());
  }

  Future<void> bufSetLines(Buffer buffer, int start, int end,
      bool strict_indexing, List<String> replacement) {
    return call('nvim_buf_set_lines', args: [
      buffer,
      start,
      end,
      strict_indexing,
      replacement,
    ]);
  }

  Future<void> bufSetText(Buffer buffer, int start_row, int start_col,
      int end_row, int end_col, List<String> replacement) {
    return call('nvim_buf_set_text', args: [
      buffer,
      start_row,
      start_col,
      end_row,
      end_col,
      replacement,
    ]);
  }

  Future<int> bufGetOffset(Buffer buffer, int index) {
    return call('nvim_buf_get_offset', args: [
      buffer,
      index,
    ]).then<int>((v) => v as int);
  }

  Future<dynamic> bufGetVar(Buffer buffer, String name) {
    return call('nvim_buf_get_var', args: [
      buffer,
      name,
    ]);
  }

  Future<int> bufGetChangedtick(Buffer buffer) {
    return call('nvim_buf_get_changedtick', args: [
      buffer,
    ]).then<int>((v) => v as int);
  }

  Future<List<Map<dynamic, dynamic>>> bufGetKeymap(Buffer buffer, String mode) {
    return call('nvim_buf_get_keymap', args: [
      buffer,
      mode,
    ]).then<List<Map<dynamic, dynamic>>>(
        (v) => (v as List).cast<Map<dynamic, dynamic>>());
  }

  Future<void> bufSetKeymap(Buffer buffer, String mode, String lhs, String rhs,
      Map<dynamic, dynamic> opts) {
    return call('nvim_buf_set_keymap', args: [
      buffer,
      mode,
      lhs,
      rhs,
      opts,
    ]);
  }

  Future<void> bufDelKeymap(Buffer buffer, String mode, String lhs) {
    return call('nvim_buf_del_keymap', args: [
      buffer,
      mode,
      lhs,
    ]);
  }

  Future<Map<dynamic, dynamic>> bufGetCommands(
      Buffer buffer, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_get_commands', args: [
      buffer,
      opts,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<void> bufSetVar(Buffer buffer, String name, dynamic value) {
    return call('nvim_buf_set_var', args: [
      buffer,
      name,
      value,
    ]);
  }

  Future<void> bufDelVar(Buffer buffer, String name) {
    return call('nvim_buf_del_var', args: [
      buffer,
      name,
    ]);
  }

  Future<dynamic> bufGetOption(Buffer buffer, String name) {
    return call('nvim_buf_get_option', args: [
      buffer,
      name,
    ]);
  }

  Future<void> bufSetOption(Buffer buffer, String name, dynamic value) {
    return call('nvim_buf_set_option', args: [
      buffer,
      name,
      value,
    ]);
  }

  Future<String> bufGetName(Buffer buffer) {
    return call('nvim_buf_get_name', args: [
      buffer,
    ]).then<String>((v) => v as String);
  }

  Future<void> bufSetName(Buffer buffer, String name) {
    return call('nvim_buf_set_name', args: [
      buffer,
      name,
    ]);
  }

  Future<bool> bufIsLoaded(Buffer buffer) {
    return call('nvim_buf_is_loaded', args: [
      buffer,
    ]).then<bool>((v) => v as bool);
  }

  Future<void> bufDelete(Buffer buffer, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_delete', args: [
      buffer,
      opts,
    ]);
  }

  Future<bool> bufIsValid(Buffer buffer) {
    return call('nvim_buf_is_valid', args: [
      buffer,
    ]).then<bool>((v) => v as bool);
  }

  Future<List<int>> bufGetMark(Buffer buffer, String name) {
    return call('nvim_buf_get_mark', args: [
      buffer,
      name,
    ]).then<List<int>>((v) => (v as List).cast<int>());
  }

  Future<List<int>> bufGetExtmarkById(
      Buffer buffer, int ns_id, int id, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_get_extmark_by_id', args: [
      buffer,
      ns_id,
      id,
      opts,
    ]).then<List<int>>((v) => (v as List).cast<int>());
  }

  Future<List<dynamic>> bufGetExtmarks(Buffer buffer, int ns_id, dynamic start,
      dynamic end, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_get_extmarks', args: [
      buffer,
      ns_id,
      start,
      end,
      opts,
    ]).then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  Future<int> bufSetExtmark(
      Buffer buffer, int ns_id, int line, int col, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_set_extmark', args: [
      buffer,
      ns_id,
      line,
      col,
      opts,
    ]).then<int>((v) => v as int);
  }

  Future<bool> bufDelExtmark(Buffer buffer, int ns_id, int id) {
    return call('nvim_buf_del_extmark', args: [
      buffer,
      ns_id,
      id,
    ]).then<bool>((v) => v as bool);
  }

  Future<int> bufAddHighlight(Buffer buffer, int ns_id, String hl_group,
      int line, int col_start, int col_end) {
    return call('nvim_buf_add_highlight', args: [
      buffer,
      ns_id,
      hl_group,
      line,
      col_start,
      col_end,
    ]).then<int>((v) => v as int);
  }

  Future<void> bufClearNamespace(
      Buffer buffer, int ns_id, int line_start, int line_end) {
    return call('nvim_buf_clear_namespace', args: [
      buffer,
      ns_id,
      line_start,
      line_end,
    ]);
  }

  Future<int> bufSetVirtualText(Buffer buffer, int src_id, int line,
      List<dynamic> chunks, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_set_virtual_text', args: [
      buffer,
      src_id,
      line,
      chunks,
      opts,
    ]).then<int>((v) => v as int);
  }

  Future<dynamic> bufCall(Buffer buffer, LuaRef fun) {
    return call('nvim_buf_call', args: [
      buffer,
      fun,
    ]);
  }

  Future<List<Buffer>> listBufs() {
    return call('nvim_list_bufs', args: [])
        .then<List<Buffer>>((v) => (v as List).cast<Buffer>());
  }

  Future<Buffer> getCurrentBuf() {
    return call('nvim_get_current_buf', args: [])
        .then<Buffer>((v) => v as Buffer);
  }

  Future<void> setCurrentBuf(Buffer buffer) {
    return call('nvim_set_current_buf', args: [
      buffer,
    ]);
  }

  Future<Buffer> createBuf(bool listed, bool scratch) {
    return call('nvim_create_buf', args: [
      listed,
      scratch,
    ]).then<Buffer>((v) => v as Buffer);
  }

  Future<Buffer> winGetBuf(Window window) {
    return call('nvim_win_get_buf', args: [
      window,
    ]).then<Buffer>((v) => v as Buffer);
  }

  Future<void> winSetBuf(Window window, Buffer buffer) {
    return call('nvim_win_set_buf', args: [
      window,
      buffer,
    ]);
  }
}
