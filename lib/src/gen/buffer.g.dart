import '../neovim.dart';

extension NvimBufferApi on Nvim {
  Future<int> bufLineCount(Buffer buffer) {
    return call('nvim_buf_line_count', args: [
      buffer,
    ]);
  }

  Future<String> bufferGetLine(Buffer buffer, int index) {
    return call('buffer_get_line', args: [
      buffer,
      index,
    ]);
  }

  Future<bool> bufAttach(
      Buffer buffer, bool send_buffer, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_attach', args: [
      buffer,
      send_buffer,
      opts,
    ]);
  }

  Future<bool> bufDetach(Buffer buffer) {
    return call('nvim_buf_detach', args: [
      buffer,
    ]);
  }

  Future<void> bufferSetLine(Buffer buffer, int index, String line) {
    return call('buffer_set_line', args: [
      buffer,
      index,
      line,
    ]);
  }

  Future<void> bufferDelLine(Buffer buffer, int index) {
    return call('buffer_del_line', args: [
      buffer,
      index,
    ]);
  }

  Future<List<String>> bufferGetLineSlice(
      Buffer buffer, int start, int end, bool include_start, bool include_end) {
    return call('buffer_get_line_slice', args: [
      buffer,
      start,
      end,
      include_start,
      include_end,
    ]);
  }

  Future<List<String>> bufGetLines(
      Buffer buffer, int start, int end, bool strict_indexing) {
    return call('nvim_buf_get_lines', args: [
      buffer,
      start,
      end,
      strict_indexing,
    ]);
  }

  Future<void> bufferSetLineSlice(Buffer buffer, int start, int end,
      bool include_start, bool include_end, List<String> replacement) {
    return call('buffer_set_line_slice', args: [
      buffer,
      start,
      end,
      include_start,
      include_end,
      replacement,
    ]);
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

  Future<int> bufGetOffset(Buffer buffer, int index) {
    return call('nvim_buf_get_offset', args: [
      buffer,
      index,
    ]);
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
    ]);
  }

  Future<List<Map<dynamic, dynamic>>> bufGetKeymap(Buffer buffer, String mode) {
    return call('nvim_buf_get_keymap', args: [
      buffer,
      mode,
    ]);
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
    ]);
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

  Future<dynamic> bufferSetVar(Buffer buffer, String name, dynamic value) {
    return call('buffer_set_var', args: [
      buffer,
      name,
      value,
    ]);
  }

  Future<dynamic> bufferDelVar(Buffer buffer, String name) {
    return call('buffer_del_var', args: [
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

  Future<int> bufGetNumber(Buffer buffer) {
    return call('nvim_buf_get_number', args: [
      buffer,
    ]);
  }

  Future<String> bufGetName(Buffer buffer) {
    return call('nvim_buf_get_name', args: [
      buffer,
    ]);
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
    ]);
  }

  Future<bool> bufIsValid(Buffer buffer) {
    return call('nvim_buf_is_valid', args: [
      buffer,
    ]);
  }

  Future<void> bufferInsert(Buffer buffer, int lnum, List<String> lines) {
    return call('buffer_insert', args: [
      buffer,
      lnum,
      lines,
    ]);
  }

  Future<List<int>> bufGetMark(Buffer buffer, String name) {
    return call('nvim_buf_get_mark', args: [
      buffer,
      name,
    ]);
  }

  Future<List<int>> bufGetExtmarkById(Buffer buffer, int ns_id, int id) {
    return call('nvim_buf_get_extmark_by_id', args: [
      buffer,
      ns_id,
      id,
    ]);
  }

  Future<List<dynamic>> bufGetExtmarks(Buffer buffer, int ns_id, dynamic start,
      dynamic end, Map<dynamic, dynamic> opts) {
    return call('nvim_buf_get_extmarks', args: [
      buffer,
      ns_id,
      start,
      end,
      opts,
    ]);
  }

  Future<int> bufSetExtmark(Buffer buffer, int ns_id, int id, int line, int col,
      Map<dynamic, dynamic> opts) {
    return call('nvim_buf_set_extmark', args: [
      buffer,
      ns_id,
      id,
      line,
      col,
      opts,
    ]);
  }

  Future<bool> bufDelExtmark(Buffer buffer, int ns_id, int id) {
    return call('nvim_buf_del_extmark', args: [
      buffer,
      ns_id,
      id,
    ]);
  }

  Future<int> bufAddHighlight(Buffer buffer, int src_id, String hl_group,
      int line, int col_start, int col_end) {
    return call('nvim_buf_add_highlight', args: [
      buffer,
      src_id,
      hl_group,
      line,
      col_start,
      col_end,
    ]);
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

  Future<void> bufClearHighlight(
      Buffer buffer, int ns_id, int line_start, int line_end) {
    return call('nvim_buf_clear_highlight', args: [
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
    ]);
  }

  Future<List<dynamic>> bufGetVirtualText(Buffer buffer, int line) {
    return call('nvim_buf_get_virtual_text', args: [
      buffer,
      line,
    ]);
  }

  Future<List<Buffer>> listBufs() {
    return call('nvim_list_bufs', args: []);
  }

  Future<Buffer> getCurrentBuf() {
    return call('nvim_get_current_buf', args: []);
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
    ]);
  }

  Future<Buffer> winGetBuf(Window window) {
    return call('nvim_win_get_buf', args: [
      window,
    ]);
  }

  Future<void> winSetBuf(Window window, Buffer buffer) {
    return call('nvim_win_set_buf', args: [
      window,
      buffer,
    ]);
  }

  Future<int> bufferLineCount(Buffer buffer) {
    return call('buffer_line_count', args: [
      buffer,
    ]);
  }

  Future<List<String>> bufferGetLines(
      Buffer buffer, int start, int end, bool strict_indexing) {
    return call('buffer_get_lines', args: [
      buffer,
      start,
      end,
      strict_indexing,
    ]);
  }

  Future<void> bufferSetLines(Buffer buffer, int start, int end,
      bool strict_indexing, List<String> replacement) {
    return call('buffer_set_lines', args: [
      buffer,
      start,
      end,
      strict_indexing,
      replacement,
    ]);
  }

  Future<dynamic> bufferGetVar(Buffer buffer, String name) {
    return call('buffer_get_var', args: [
      buffer,
      name,
    ]);
  }

  Future<dynamic> bufferGetOption(Buffer buffer, String name) {
    return call('buffer_get_option', args: [
      buffer,
      name,
    ]);
  }

  Future<void> bufferSetOption(Buffer buffer, String name, dynamic value) {
    return call('buffer_set_option', args: [
      buffer,
      name,
      value,
    ]);
  }

  Future<int> bufferGetNumber(Buffer buffer) {
    return call('buffer_get_number', args: [
      buffer,
    ]);
  }

  Future<String> bufferGetName(Buffer buffer) {
    return call('buffer_get_name', args: [
      buffer,
    ]);
  }

  Future<void> bufferSetName(Buffer buffer, String name) {
    return call('buffer_set_name', args: [
      buffer,
      name,
    ]);
  }

  Future<bool> bufferIsValid(Buffer buffer) {
    return call('buffer_is_valid', args: [
      buffer,
    ]);
  }

  Future<List<int>> bufferGetMark(Buffer buffer, String name) {
    return call('buffer_get_mark', args: [
      buffer,
      name,
    ]);
  }

  Future<int> bufferAddHighlight(Buffer buffer, int src_id, String hl_group,
      int line, int col_start, int col_end) {
    return call('buffer_add_highlight', args: [
      buffer,
      src_id,
      hl_group,
      line,
      col_start,
      col_end,
    ]);
  }

  Future<void> bufferClearHighlight(
      Buffer buffer, int ns_id, int line_start, int line_end) {
    return call('buffer_clear_highlight', args: [
      buffer,
      ns_id,
      line_start,
      line_end,
    ]);
  }

  Future<List<Buffer>> getBuffers() {
    return call('vim_get_buffers', args: []);
  }

  Future<Buffer> getCurrentBuffer() {
    return call('vim_get_current_buffer', args: []);
  }

  Future<void> setCurrentBuffer(Buffer buffer) {
    return call('vim_set_current_buffer', args: [
      buffer,
    ]);
  }

  Future<Buffer> windowGetBuffer(Window window) {
    return call('window_get_buffer', args: [
      window,
    ]);
  }
}
