extension NvimApi on Nvim {
  Future<void> uiAttach(int width, int height, Map<dynamic, dynamic> options) {
    return _call('nvim_ui_attach', args: [
      width,
      height,
      options,
    ]);
  }

  Future<void> uiAttach(int width, int height, bool enable_rgb) {
    return _call('ui_attach', args: [
      width,
      height,
      enable_rgb,
    ]);
  }

  Future<void> uiDetach() {
    return _call('nvim_ui_detach', args: []);
  }

  Future<void> uiTryResize(int width, int height) {
    return _call('nvim_ui_try_resize', args: [
      width,
      height,
    ]);
  }

  Future<void> uiSetOption(String name, dynamic value) {
    return _call('nvim_ui_set_option', args: [
      name,
      value,
    ]);
  }

  Future<void> uiTryResizeGrid(int grid, int width, int height) {
    return _call('nvim_ui_try_resize_grid', args: [
      grid,
      width,
      height,
    ]);
  }

  Future<void> uiPumSetHeight(int height) {
    return _call('nvim_ui_pum_set_height', args: [
      height,
    ]);
  }

  Future<void> uiPumSetBounds(
      double width, double height, double row, double col) {
    return _call('nvim_ui_pum_set_bounds', args: [
      width,
      height,
      row,
      col,
    ]);
  }

  Future<String> exec(String src, bool output) {
    return _call('nvim_exec', args: [
      src,
      output,
    ]);
  }

  Future<void> command(String command) {
    return _call('nvim_command', args: [
      command,
    ]);
  }

  Future<Map<dynamic, dynamic>> getHlByName(String name, bool rgb) {
    return _call('nvim_get_hl_by_name', args: [
      name,
      rgb,
    ]);
  }

  Future<Map<dynamic, dynamic>> getHlById(int hl_id, bool rgb) {
    return _call('nvim_get_hl_by_id', args: [
      hl_id,
      rgb,
    ]);
  }

  Future<int> getHlIdByName(String name) {
    return _call('nvim_get_hl_id_by_name', args: [
      name,
    ]);
  }

  Future<void> feedkeys(String keys, String mode, bool escape_csi) {
    return _call('nvim_feedkeys', args: [
      keys,
      mode,
      escape_csi,
    ]);
  }

  Future<int> input(String keys) {
    return _call('nvim_input', args: [
      keys,
    ]);
  }

  Future<void> inputMouse(String button, String action, String modifier,
      int grid, int row, int col) {
    return _call('nvim_input_mouse', args: [
      button,
      action,
      modifier,
      grid,
      row,
      col,
    ]);
  }

  Future<String> replaceTermcodes(
      String str, bool from_part, bool do_lt, bool special) {
    return _call('nvim_replace_termcodes', args: [
      str,
      from_part,
      do_lt,
      special,
    ]);
  }

  Future<String> commandOutput(String command) {
    return _call('nvim_command_output', args: [
      command,
    ]);
  }

  Future<dynamic> eval(String expr) {
    return _call('nvim_eval', args: [
      expr,
    ]);
  }

  Future<dynamic> executeLua(String code, List<dynamic> args) {
    return _call('nvim_execute_lua', args: [
      code,
      args,
    ]);
  }

  Future<dynamic> execLua(String code, List<dynamic> args) {
    return _call('nvim_exec_lua', args: [
      code,
      args,
    ]);
  }

  Future<dynamic> callFunction(String fn, List<dynamic> args) {
    return _call('nvim_call_function', args: [
      fn,
      args,
    ]);
  }

  Future<dynamic> callDictFunction(
      dynamic dict, String fn, List<dynamic> args) {
    return _call('nvim_call_dict_function', args: [
      dict,
      fn,
      args,
    ]);
  }

  Future<int> strwidth(String text) {
    return _call('nvim_strwidth', args: [
      text,
    ]);
  }

  Future<List<String>> listRuntimePaths() {
    return _call('nvim_list_runtime_paths', args: []);
  }

  Future<List<String>> getRuntimeFile(String name, bool all) {
    return _call('nvim_get_runtime_file', args: [
      name,
      all,
    ]);
  }

  Future<void> setCurrentDir(String dir) {
    return _call('nvim_set_current_dir', args: [
      dir,
    ]);
  }

  Future<String> getCurrentLine() {
    return _call('nvim_get_current_line', args: []);
  }

  Future<void> setCurrentLine(String line) {
    return _call('nvim_set_current_line', args: [
      line,
    ]);
  }

  Future<void> delCurrentLine() {
    return _call('nvim_del_current_line', args: []);
  }

  Future<dynamic> getVar(String name) {
    return _call('nvim_get_var', args: [
      name,
    ]);
  }

  Future<void> setVar(String name, dynamic value) {
    return _call('nvim_set_var', args: [
      name,
      value,
    ]);
  }

  Future<void> delVar(String name) {
    return _call('nvim_del_var', args: [
      name,
    ]);
  }

  Future<dynamic> setVar(String name, dynamic value) {
    return _call('vim_set_var', args: [
      name,
      value,
    ]);
  }

  Future<dynamic> delVar(String name) {
    return _call('vim_del_var', args: [
      name,
    ]);
  }

  Future<dynamic> getVvar(String name) {
    return _call('nvim_get_vvar', args: [
      name,
    ]);
  }

  Future<void> setVvar(String name, dynamic value) {
    return _call('nvim_set_vvar', args: [
      name,
      value,
    ]);
  }

  Future<dynamic> getOption(String name) {
    return _call('nvim_get_option', args: [
      name,
    ]);
  }

  Future<void> setOption(String name, dynamic value) {
    return _call('nvim_set_option', args: [
      name,
      value,
    ]);
  }

  Future<void> outWrite(String str) {
    return _call('nvim_out_write', args: [
      str,
    ]);
  }

  Future<void> errWrite(String str) {
    return _call('nvim_err_write', args: [
      str,
    ]);
  }

  Future<void> errWriteln(String str) {
    return _call('nvim_err_writeln', args: [
      str,
    ]);
  }

  Future<int> createNamespace(String name) {
    return _call('nvim_create_namespace', args: [
      name,
    ]);
  }

  Future<Map<dynamic, dynamic>> getNamespaces() {
    return _call('nvim_get_namespaces', args: []);
  }

  Future<bool> paste(String data, bool crlf, int phase) {
    return _call('nvim_paste', args: [
      data,
      crlf,
      phase,
    ]);
  }

  Future<void> put(List<String> lines, String type, bool after, bool follow) {
    return _call('nvim_put', args: [
      lines,
      type,
      after,
      follow,
    ]);
  }

  Future<void> subscribe(String event) {
    return _call('nvim_subscribe', args: [
      event,
    ]);
  }

  Future<void> unsubscribe(String event) {
    return _call('nvim_unsubscribe', args: [
      event,
    ]);
  }

  Future<int> getColorByName(String name) {
    return _call('nvim_get_color_by_name', args: [
      name,
    ]);
  }

  Future<Map<dynamic, dynamic>> getColorMap() {
    return _call('nvim_get_color_map', args: []);
  }

  Future<Map<dynamic, dynamic>> getContext(Map<dynamic, dynamic> opts) {
    return _call('nvim_get_context', args: [
      opts,
    ]);
  }

  Future<dynamic> loadContext(Map<dynamic, dynamic> dict) {
    return _call('nvim_load_context', args: [
      dict,
    ]);
  }

  Future<Map<dynamic, dynamic>> getMode() {
    return _call('nvim_get_mode', args: []);
  }

  Future<List<Map<dynamic, dynamic>>> getKeymap(String mode) {
    return _call('nvim_get_keymap', args: [
      mode,
    ]);
  }

  Future<void> setKeymap(
      String mode, String lhs, String rhs, Map<dynamic, dynamic> opts) {
    return _call('nvim_set_keymap', args: [
      mode,
      lhs,
      rhs,
      opts,
    ]);
  }

  Future<void> delKeymap(String mode, String lhs) {
    return _call('nvim_del_keymap', args: [
      mode,
      lhs,
    ]);
  }

  Future<Map<dynamic, dynamic>> getCommands(Map<dynamic, dynamic> opts) {
    return _call('nvim_get_commands', args: [
      opts,
    ]);
  }

  Future<List<dynamic>> getApiInfo() {
    return _call('nvim_get_api_info', args: []);
  }

  Future<void> setClientInfo(
      String name,
      Map<dynamic, dynamic> version,
      String type,
      Map<dynamic, dynamic> methods,
      Map<dynamic, dynamic> attributes) {
    return _call('nvim_set_client_info', args: [
      name,
      version,
      type,
      methods,
      attributes,
    ]);
  }

  Future<Map<dynamic, dynamic>> getChanInfo(int chan) {
    return _call('nvim_get_chan_info', args: [
      chan,
    ]);
  }

  Future<List<dynamic>> listChans() {
    return _call('nvim_list_chans', args: []);
  }

  Future<List<dynamic>> callAtomic(List<dynamic> calls) {
    return _call('nvim_call_atomic', args: [
      calls,
    ]);
  }

  Future<Map<dynamic, dynamic>> parseExpression(
      String expr, String flags, bool highlight) {
    return _call('nvim_parse_expression', args: [
      expr,
      flags,
      highlight,
    ]);
  }

  Future<List<dynamic>> listUis() {
    return _call('nvim_list_uis', args: []);
  }

  Future<List<dynamic>> getProcChildren(int pid) {
    return _call('nvim_get_proc_children', args: [
      pid,
    ]);
  }

  Future<dynamic> getProc(int pid) {
    return _call('nvim_get_proc', args: [
      pid,
    ]);
  }

  Future<void> selectPopupmenuItem(
      int item, bool insert, bool finish, Map<dynamic, dynamic> opts) {
    return _call('nvim_select_popupmenu_item', args: [
      item,
      insert,
      finish,
      opts,
    ]);
  }

  Future<void> uiDetach() {
    return _call('ui_detach', args: []);
  }

  Future<dynamic> uiTryResize(int width, int height) {
    return _call('ui_try_resize', args: [
      width,
      height,
    ]);
  }

  Future<void> command(String command) {
    return _call('vim_command', args: [
      command,
    ]);
  }

  Future<void> feedkeys(String keys, String mode, bool escape_csi) {
    return _call('vim_feedkeys', args: [
      keys,
      mode,
      escape_csi,
    ]);
  }

  Future<int> input(String keys) {
    return _call('vim_input', args: [
      keys,
    ]);
  }

  Future<String> replaceTermcodes(
      String str, bool from_part, bool do_lt, bool special) {
    return _call('vim_replace_termcodes', args: [
      str,
      from_part,
      do_lt,
      special,
    ]);
  }

  Future<String> commandOutput(String command) {
    return _call('vim_command_output', args: [
      command,
    ]);
  }

  Future<dynamic> eval(String expr) {
    return _call('vim_eval', args: [
      expr,
    ]);
  }

  Future<dynamic> callFunction(String fn, List<dynamic> args) {
    return _call('vim_call_function', args: [
      fn,
      args,
    ]);
  }

  Future<int> strwidth(String text) {
    return _call('vim_strwidth', args: [
      text,
    ]);
  }

  Future<List<String>> listRuntimePaths() {
    return _call('vim_list_runtime_paths', args: []);
  }

  Future<void> changeDirectory(String dir) {
    return _call('vim_change_directory', args: [
      dir,
    ]);
  }

  Future<String> getCurrentLine() {
    return _call('vim_get_current_line', args: []);
  }

  Future<void> setCurrentLine(String line) {
    return _call('vim_set_current_line', args: [
      line,
    ]);
  }

  Future<void> delCurrentLine() {
    return _call('vim_del_current_line', args: []);
  }

  Future<dynamic> getVar(String name) {
    return _call('vim_get_var', args: [
      name,
    ]);
  }

  Future<dynamic> getVvar(String name) {
    return _call('vim_get_vvar', args: [
      name,
    ]);
  }

  Future<dynamic> getOption(String name) {
    return _call('vim_get_option', args: [
      name,
    ]);
  }

  Future<void> setOption(String name, dynamic value) {
    return _call('vim_set_option', args: [
      name,
      value,
    ]);
  }

  Future<void> outWrite(String str) {
    return _call('vim_out_write', args: [
      str,
    ]);
  }

  Future<void> errWrite(String str) {
    return _call('vim_err_write', args: [
      str,
    ]);
  }

  Future<void> reportError(String str) {
    return _call('vim_report_error', args: [
      str,
    ]);
  }

  Future<void> subscribe(String event) {
    return _call('vim_subscribe', args: [
      event,
    ]);
  }

  Future<void> unsubscribe(String event) {
    return _call('vim_unsubscribe', args: [
      event,
    ]);
  }

  Future<int> nameToColor(String name) {
    return _call('vim_name_to_color', args: [
      name,
    ]);
  }

  Future<Map<dynamic, dynamic>> getColorMap() {
    return _call('vim_get_color_map', args: []);
  }

  Future<List<dynamic>> getApiInfo() {
    return _call('vim_get_api_info', args: []);
  }
}
