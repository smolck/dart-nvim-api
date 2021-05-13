import '../neovim.dart';
import '../ext_types.dart';

extension NvimApi on Nvim {
  Future<void> uiAttach(int width, int height, Map<dynamic, dynamic> options) {
    return call('nvim_ui_attach', args: [
      width,
      height,
      options,
    ]);
  }

  Future<void> uiDetach() {
    return call('nvim_ui_detach', args: []);
  }

  Future<void> uiTryResize(int width, int height) {
    return call('nvim_ui_try_resize', args: [
      width,
      height,
    ]);
  }

  Future<void> uiSetOption(String name, dynamic value) {
    return call('nvim_ui_set_option', args: [
      name,
      value,
    ]);
  }

  Future<void> uiTryResizeGrid(int grid, int width, int height) {
    return call('nvim_ui_try_resize_grid', args: [
      grid,
      width,
      height,
    ]);
  }

  Future<void> uiPumSetHeight(int height) {
    return call('nvim_ui_pum_set_height', args: [
      height,
    ]);
  }

  Future<void> uiPumSetBounds(
      double width, double height, double row, double col) {
    return call('nvim_ui_pum_set_bounds', args: [
      width,
      height,
      row,
      col,
    ]);
  }

  Future<String> exec(String src, bool output) {
    return call('nvim_exec', args: [
      src,
      output,
    ]).then<String>((v) => v as String);
  }

  Future<void> command(String command) {
    return call('nvim_command', args: [
      command,
    ]);
  }

  Future<Map<dynamic, dynamic>> getHlByName(String name, bool rgb) {
    return call('nvim_get_hl_by_name', args: [
      name,
      rgb,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<Map<dynamic, dynamic>> getHlById(int hl_id, bool rgb) {
    return call('nvim_get_hl_by_id', args: [
      hl_id,
      rgb,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<int> getHlIdByName(String name) {
    return call('nvim_get_hl_id_by_name', args: [
      name,
    ]).then<int>((v) => v as int);
  }

  Future<void> setHl(int ns_id, String name, Map<dynamic, dynamic> val) {
    return call('nvim_set_hl', args: [
      ns_id,
      name,
      val,
    ]);
  }

  Future<void> feedkeys(String keys, String mode, bool escape_csi) {
    return call('nvim_feedkeys', args: [
      keys,
      mode,
      escape_csi,
    ]);
  }

  Future<int> input(String keys) {
    return call('nvim_input', args: [
      keys,
    ]).then<int>((v) => v as int);
  }

  Future<void> inputMouse(String button, String action, String modifier,
      int grid, int row, int col) {
    return call('nvim_input_mouse', args: [
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
    return call('nvim_replace_termcodes', args: [
      str,
      from_part,
      do_lt,
      special,
    ]).then<String>((v) => v as String);
  }

  Future<dynamic> eval(String expr) {
    return call('nvim_eval', args: [
      expr,
    ]);
  }

  Future<dynamic> execLua(String code, List<dynamic> args) {
    return call('nvim_exec_lua', args: [
      code,
      args,
    ]);
  }

  Future<dynamic> notify(
      String msg, int log_level, Map<dynamic, dynamic> opts) {
    return call('nvim_notify', args: [
      msg,
      log_level,
      opts,
    ]);
  }

  Future<dynamic> callFunction(String fn, List<dynamic> args) {
    return call('nvim_call_function', args: [
      fn,
      args,
    ]);
  }

  Future<dynamic> callDictFunction(
      dynamic dict, String fn, List<dynamic> args) {
    return call('nvim_call_dict_function', args: [
      dict,
      fn,
      args,
    ]);
  }

  Future<int> strwidth(String text) {
    return call('nvim_strwidth', args: [
      text,
    ]).then<int>((v) => v as int);
  }

  Future<List<String>> listRuntimePaths() {
    return call('nvim_list_runtime_paths', args: [])
        .then<List<String>>((v) => (v as List).cast<String>());
  }

  Future<List<String>> getRuntimeFile(String name, bool all) {
    return call('nvim_get_runtime_file', args: [
      name,
      all,
    ]).then<List<String>>((v) => (v as List).cast<String>());
  }

  Future<void> setCurrentDir(String dir) {
    return call('nvim_set_current_dir', args: [
      dir,
    ]);
  }

  Future<String> getCurrentLine() {
    return call('nvim_get_current_line', args: [])
        .then<String>((v) => v as String);
  }

  Future<void> setCurrentLine(String line) {
    return call('nvim_set_current_line', args: [
      line,
    ]);
  }

  Future<void> delCurrentLine() {
    return call('nvim_del_current_line', args: []);
  }

  Future<dynamic> getVar(String name) {
    return call('nvim_get_var', args: [
      name,
    ]);
  }

  Future<void> setVar(String name, dynamic value) {
    return call('nvim_set_var', args: [
      name,
      value,
    ]);
  }

  Future<void> delVar(String name) {
    return call('nvim_del_var', args: [
      name,
    ]);
  }

  Future<dynamic> getVvar(String name) {
    return call('nvim_get_vvar', args: [
      name,
    ]);
  }

  Future<void> setVvar(String name, dynamic value) {
    return call('nvim_set_vvar', args: [
      name,
      value,
    ]);
  }

  Future<dynamic> getOption(String name) {
    return call('nvim_get_option', args: [
      name,
    ]);
  }

  Future<Map<dynamic, dynamic>> getAllOptionsInfo() {
    return call('nvim_get_all_options_info', args: [])
        .then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<Map<dynamic, dynamic>> getOptionInfo(String name) {
    return call('nvim_get_option_info', args: [
      name,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<void> setOption(String name, dynamic value) {
    return call('nvim_set_option', args: [
      name,
      value,
    ]);
  }

  Future<void> echo(
      List<dynamic> chunks, bool history, Map<dynamic, dynamic> opts) {
    return call('nvim_echo', args: [
      chunks,
      history,
      opts,
    ]);
  }

  Future<void> outWrite(String str) {
    return call('nvim_out_write', args: [
      str,
    ]);
  }

  Future<void> errWrite(String str) {
    return call('nvim_err_write', args: [
      str,
    ]);
  }

  Future<void> errWriteln(String str) {
    return call('nvim_err_writeln', args: [
      str,
    ]);
  }

  Future<int> openTerm(Buffer buffer, Map<dynamic, dynamic> opts) {
    return call('nvim_open_term', args: [
      buffer,
      opts,
    ]).then<int>((v) => v as int);
  }

  Future<void> chanSend(int chan, String data) {
    return call('nvim_chan_send', args: [
      chan,
      data,
    ]);
  }

  Future<int> createNamespace(String name) {
    return call('nvim_create_namespace', args: [
      name,
    ]).then<int>((v) => v as int);
  }

  Future<Map<dynamic, dynamic>> getNamespaces() {
    return call('nvim_get_namespaces', args: [])
        .then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<bool> paste(String data, bool crlf, int phase) {
    return call('nvim_paste', args: [
      data,
      crlf,
      phase,
    ]).then<bool>((v) => v as bool);
  }

  Future<void> put(List<String> lines, String type, bool after, bool follow) {
    return call('nvim_put', args: [
      lines,
      type,
      after,
      follow,
    ]);
  }

  Future<void> subscribe(String event) {
    return call('nvim_subscribe', args: [
      event,
    ]);
  }

  Future<void> unsubscribe(String event) {
    return call('nvim_unsubscribe', args: [
      event,
    ]);
  }

  Future<int> getColorByName(String name) {
    return call('nvim_get_color_by_name', args: [
      name,
    ]).then<int>((v) => v as int);
  }

  Future<Map<dynamic, dynamic>> getColorMap() {
    return call('nvim_get_color_map', args: [])
        .then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<Map<dynamic, dynamic>> getContext(Map<dynamic, dynamic> opts) {
    return call('nvim_get_context', args: [
      opts,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<dynamic> loadContext(Map<dynamic, dynamic> dict) {
    return call('nvim_load_context', args: [
      dict,
    ]);
  }

  Future<Map<dynamic, dynamic>> getMode() {
    return call('nvim_get_mode', args: [])
        .then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<List<Map<dynamic, dynamic>>> getKeymap(String mode) {
    return call('nvim_get_keymap', args: [
      mode,
    ]).then<List<Map<dynamic, dynamic>>>(
        (v) => (v as List).cast<Map<dynamic, dynamic>>());
  }

  Future<void> setKeymap(
      String mode, String lhs, String rhs, Map<dynamic, dynamic> opts) {
    return call('nvim_set_keymap', args: [
      mode,
      lhs,
      rhs,
      opts,
    ]);
  }

  Future<void> delKeymap(String mode, String lhs) {
    return call('nvim_del_keymap', args: [
      mode,
      lhs,
    ]);
  }

  Future<Map<dynamic, dynamic>> getCommands(Map<dynamic, dynamic> opts) {
    return call('nvim_get_commands', args: [
      opts,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<List<dynamic>> getApiInfo() {
    return call('nvim_get_api_info', args: [])
        .then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  Future<void> setClientInfo(
      String name,
      Map<dynamic, dynamic> version,
      String type,
      Map<dynamic, dynamic> methods,
      Map<dynamic, dynamic> attributes) {
    return call('nvim_set_client_info', args: [
      name,
      version,
      type,
      methods,
      attributes,
    ]);
  }

  Future<Map<dynamic, dynamic>> getChanInfo(int chan) {
    return call('nvim_get_chan_info', args: [
      chan,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<List<dynamic>> listChans() {
    return call('nvim_list_chans', args: [])
        .then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  Future<List<dynamic>> callAtomic(List<dynamic> calls) {
    return call('nvim_call_atomic', args: [
      calls,
    ]).then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  Future<Map<dynamic, dynamic>> parseExpression(
      String expr, String flags, bool highlight) {
    return call('nvim_parse_expression', args: [
      expr,
      flags,
      highlight,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<List<dynamic>> listUis() {
    return call('nvim_list_uis', args: [])
        .then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  Future<List<dynamic>> getProcChildren(int pid) {
    return call('nvim_get_proc_children', args: [
      pid,
    ]).then<List<dynamic>>((v) => (v as List).cast<dynamic>());
  }

  Future<dynamic> getProc(int pid) {
    return call('nvim_get_proc', args: [
      pid,
    ]);
  }

  Future<void> selectPopupmenuItem(
      int item, bool insert, bool finish, Map<dynamic, dynamic> opts) {
    return call('nvim_select_popupmenu_item', args: [
      item,
      insert,
      finish,
      opts,
    ]);
  }

  Future<void> setDecorationProvider(int ns_id, Map<dynamic, dynamic> opts) {
    return call('nvim_set_decoration_provider', args: [
      ns_id,
      opts,
    ]);
  }
}
