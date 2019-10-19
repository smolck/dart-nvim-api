// Generated 2019-10-19 12:34:04.198322 by `gen_bindings.py`.
// DO NOT MODIFY DIRECTLY!

import 'dart:async';
import 'package:meta/meta.dart';
import 'package:dart_nvim_api/session.dart';
import 'package:dart_nvim_api/ui_attach_options.dart';

class Buffer {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Buffer(this._codeData);

  /// since: 1
  Future<int> Nvim_buf_line_count(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_line_count", args: [_codeData]);
  }

  /// since: 4
  Future<bool> Nvim_buf_attach(
      Neovim neovim, bool send_buffer, Map<dynamic, dynamic> opts) {
    return neovim.session
        .call("nvim_buf_attach", args: [_codeData, send_buffer, opts]);
  }

  /// since: 4
  Future<bool> Nvim_buf_detach(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_detach", args: [_codeData]);
  }

  /// since: 1
  Future<List<String>> Nvim_buf_get_lines(
      Neovim neovim, int start, int end, bool strict_indexing) {
    return neovim.session.call("nvim_buf_get_lines",
        args: [_codeData, start, end, strict_indexing]);
  }

  /// since: 1
  Future<void> Nvim_buf_set_lines(Neovim neovim, int start, int end,
      bool strict_indexing, List<String> replacement) {
    return neovim.session.call("nvim_buf_set_lines",
        args: [_codeData, start, end, strict_indexing, replacement]);
  }

  /// since: 5
  Future<int> Nvim_buf_get_offset(Neovim neovim, int index) {
    return neovim.session.call("nvim_buf_get_offset", args: [_codeData, index]);
  }

  /// since: 1
  Future<dynamic> Nvim_buf_get_var(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_get_var", args: [_codeData, name]);
  }

  /// since: 2
  Future<int> Nvim_buf_get_changedtick(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_get_changedtick", args: [_codeData]);
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> Nvim_buf_get_keymap(
      Neovim neovim, String mode) {
    return neovim.session.call("nvim_buf_get_keymap", args: [_codeData, mode]);
  }

  /// since: 6
  Future<void> Nvim_buf_set_keymap(Neovim neovim, String mode, String lhs,
      String rhs, Map<dynamic, dynamic> opts) {
    return neovim.session
        .call("nvim_buf_set_keymap", args: [_codeData, mode, lhs, rhs, opts]);
  }

  /// since: 6
  Future<void> Nvim_buf_del_keymap(Neovim neovim, String mode, String lhs) {
    return neovim.session
        .call("nvim_buf_del_keymap", args: [_codeData, mode, lhs]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> Nvim_buf_get_commands(
      Neovim neovim, Map<dynamic, dynamic> opts) {
    return neovim.session
        .call("nvim_buf_get_commands", args: [_codeData, opts]);
  }

  /// since: 1
  Future<void> Nvim_buf_set_var(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_buf_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> Nvim_buf_del_var(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> Nvim_buf_get_option(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_get_option", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> Nvim_buf_set_option(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_buf_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<int> Nvim_buf_get_number(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<String> Nvim_buf_get_name(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_get_name", args: [_codeData]);
  }

  /// since: 1
  Future<void> Nvim_buf_set_name(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_set_name", args: [_codeData, name]);
  }

  /// since: 5
  Future<bool> Nvim_buf_is_loaded(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_is_loaded", args: [_codeData]);
  }

  /// since: 1
  Future<bool> Nvim_buf_is_valid(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_buf_is_valid", args: [_codeData]);
  }

  /// since: 1
  Future<List<int>> Nvim_buf_get_mark(Neovim neovim, String name) {
    return neovim.session.call("nvim_buf_get_mark", args: [_codeData, name]);
  }

  /// since: 1
  Future<int> Nvim_buf_add_highlight(Neovim neovim, int ns_id, String hl_group,
      int line, int col_start, int col_end) {
    return neovim.session.call("nvim_buf_add_highlight",
        args: [_codeData, ns_id, hl_group, line, col_start, col_end]);
  }

  /// since: 5
  Future<void> Nvim_buf_clear_namespace(
      Neovim neovim, int ns_id, int line_start, int line_end) {
    return neovim.session.call("nvim_buf_clear_namespace",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 1
  Future<void> Nvim_buf_clear_highlight(
      Neovim neovim, int ns_id, int line_start, int line_end) {
    return neovim.session.call("nvim_buf_clear_highlight",
        args: [_codeData, ns_id, line_start, line_end]);
  }

  /// since: 5
  Future<int> Nvim_buf_set_virtual_text(Neovim neovim, int ns_id, int line,
      List<dynamic> chunks, Map<dynamic, dynamic> opts) {
    return neovim.session.call("nvim_buf_set_virtual_text",
        args: [_codeData, ns_id, line, chunks, opts]);
  }
}

class Window {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Window(this._codeData);

  /// since: 1
  Future<Buffer> Nvim_win_get_buf(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_buf", args: [_codeData]);
  }

  /// since: 5
  Future<void> Nvim_win_set_buf(Neovim neovim, Buffer buffer) {
    return neovim.session.call("nvim_win_set_buf", args: [_codeData, buffer]);
  }

  /// since: 1
  Future<List<int>> Nvim_win_get_cursor(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_cursor", args: [_codeData]);
  }

  /// since: 1
  Future<void> Nvim_win_set_cursor(Neovim neovim, List<int> pos) {
    return neovim.session.call("nvim_win_set_cursor", args: [_codeData, pos]);
  }

  /// since: 1
  Future<int> Nvim_win_get_height(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_height", args: [_codeData]);
  }

  /// since: 1
  Future<void> Nvim_win_set_height(Neovim neovim, int height) {
    return neovim.session
        .call("nvim_win_set_height", args: [_codeData, height]);
  }

  /// since: 1
  Future<int> Nvim_win_get_width(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_width", args: [_codeData]);
  }

  /// since: 1
  Future<void> Nvim_win_set_width(Neovim neovim, int width) {
    return neovim.session.call("nvim_win_set_width", args: [_codeData, width]);
  }

  /// since: 1
  Future<dynamic> Nvim_win_get_var(Neovim neovim, String name) {
    return neovim.session.call("nvim_win_get_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> Nvim_win_set_var(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_win_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> Nvim_win_del_var(Neovim neovim, String name) {
    return neovim.session.call("nvim_win_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<dynamic> Nvim_win_get_option(Neovim neovim, String name) {
    return neovim.session.call("nvim_win_get_option", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> Nvim_win_set_option(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_win_set_option", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<List<int>> Nvim_win_get_position(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_position", args: [_codeData]);
  }

  /// since: 1
  Future<Tabpage> Nvim_win_get_tabpage(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_tabpage", args: [_codeData]);
  }

  /// since: 1
  Future<int> Nvim_win_get_number(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<bool> Nvim_win_is_valid(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_is_valid", args: [_codeData]);
  }

  /// since: 6
  Future<void> Nvim_win_set_config(
      Neovim neovim, Map<dynamic, dynamic> config) {
    return neovim.session
        .call("nvim_win_set_config", args: [_codeData, config]);
  }

  /// since: 6
  Future<Map<dynamic, dynamic>> Nvim_win_get_config(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_win_get_config", args: [_codeData]);
  }

  /// since: 6
  Future<void> Nvim_win_close(Neovim neovim, bool force) {
    return neovim.session.call("nvim_win_close", args: [_codeData, force]);
  }
}

class Tabpage {
  dynamic _codeData;

  /// Internal value that represents the type.
  get codeData => _codeData;
  Tabpage(this._codeData);

  /// since: 1
  Future<List<Window>> Nvim_tabpage_list_wins(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_list_wins", args: [_codeData]);
  }

  /// since: 1
  Future<dynamic> Nvim_tabpage_get_var(Neovim neovim, String name) {
    return neovim.session.call("nvim_tabpage_get_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<void> Nvim_tabpage_set_var(Neovim neovim, String name, dynamic value) {
    return neovim.session
        .call("nvim_tabpage_set_var", args: [_codeData, name, value]);
  }

  /// since: 1
  Future<void> Nvim_tabpage_del_var(Neovim neovim, String name) {
    return neovim.session.call("nvim_tabpage_del_var", args: [_codeData, name]);
  }

  /// since: 1
  Future<Window> Nvim_tabpage_get_win(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_get_win", args: [_codeData]);
  }

  /// since: 1
  Future<int> Nvim_tabpage_get_number(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_get_number", args: [_codeData]);
  }

  /// since: 1
  Future<bool> Nvim_tabpage_is_valid(
    Neovim neovim,
  ) {
    return neovim.session.call("nvim_tabpage_is_valid", args: [_codeData]);
  }
}

class Neovim {
  Session _session;
  get session => _session;

  Neovim.fromSession(this._session);
  Neovim.connectToRunningInstance({
    @required String host,
    @required int port,
  }) : _session = Session.fromRunningInstance(host: host, port: port);
  Neovim({String nvimBinaryPath})
      : _session = Session(nvim: nvimBinaryPath ?? '/usr/bin/nvim');

  Future<void> uiDetach() async {
    var retVal = await _session.call("nvim_ui_detach", args: []);

    return retVal;
  }

  Future<void> uiTryResize(int width, int height) async {
    var retVal =
        await _session.call("nvim_ui_try_resize", args: [width, height]);

    return retVal;
  }

  Future<void> uiSetOption(String name, dynamic value) async {
    var retVal = await _session.call("nvim_ui_set_option", args: [name, value]);

    return retVal;
  }

  Future<void> uiTryResizeGrid(int grid, int width, int height) async {
    var retVal = await _session
        .call("nvim_ui_try_resize_grid", args: [grid, width, height]);

    return retVal;
  }

  Future<void> uiPumSetHeight(int height) async {
    var retVal = await _session.call("nvim_ui_pum_set_height", args: [height]);

    return retVal;
  }

  Future<void> command(String command) async {
    var retVal = await _session.call("nvim_command", args: [command]);

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getHlByName(String name, bool rgb) async {
    var retVal = await _session.call("nvim_get_hl_by_name", args: [name, rgb]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getHlById(int hl_id, bool rgb) async {
    var retVal = await _session.call("nvim_get_hl_by_id", args: [hl_id, rgb]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<void> feedkeys(String keys, String mode, bool escape_csi) async {
    var retVal =
        await _session.call("nvim_feedkeys", args: [keys, mode, escape_csi]);

    return retVal;
  }

  Future<int> input(String keys) async {
    var retVal = await _session.call("nvim_input", args: [keys]);

    retVal = retVal as int;

    return retVal;
  }

  Future<void> inputMouse(String button, String action, String modifier,
      int grid, int row, int col) async {
    var retVal = await _session.call("nvim_input_mouse",
        args: [button, action, modifier, grid, row, col]);

    return retVal;
  }

  Future<String> replaceTermcodes(
      String str, bool from_part, bool do_lt, bool special) async {
    var retVal = await _session
        .call("nvim_replace_termcodes", args: [str, from_part, do_lt, special]);

    retVal = retVal as String;

    return retVal;
  }

  Future<String> commandOutput(String command) async {
    var retVal = await _session.call("nvim_command_output", args: [command]);

    retVal = retVal as String;

    return retVal;
  }

  Future<dynamic> eval(String expr) async {
    var retVal = await _session.call("nvim_eval", args: [expr]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<dynamic> executeLua(String code, List<dynamic> args) async {
    var retVal = await _session.call("nvim_execute_lua", args: [code, args]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<dynamic> callFunction(String fn, List<dynamic> args) async {
    var retVal = await _session.call("nvim_call_function", args: [fn, args]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<dynamic> callDictFunction(
      dynamic dict, String fn, List<dynamic> args) async {
    var retVal =
        await _session.call("nvim_call_dict_function", args: [dict, fn, args]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<int> strwidth(String text) async {
    var retVal = await _session.call("nvim_strwidth", args: [text]);

    retVal = retVal as int;

    return retVal;
  }

  Future<List<String>> listRuntimePaths() async {
    var retVal = await _session.call("nvim_list_runtime_paths", args: []);

    retVal = List<String>.from(retVal);

    return retVal;
  }

  Future<void> setCurrentDir(String dir) async {
    var retVal = await _session.call("nvim_set_current_dir", args: [dir]);

    return retVal;
  }

  Future<String> getCurrentLine() async {
    var retVal = await _session.call("nvim_get_current_line", args: []);

    retVal = retVal as String;

    return retVal;
  }

  Future<void> setCurrentLine(String line) async {
    var retVal = await _session.call("nvim_set_current_line", args: [line]);

    return retVal;
  }

  Future<void> delCurrentLine() async {
    var retVal = await _session.call("nvim_del_current_line", args: []);

    return retVal;
  }

  Future<dynamic> getVar(String name) async {
    var retVal = await _session.call("nvim_get_var", args: [name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<void> setVar(String name, dynamic value) async {
    var retVal = await _session.call("nvim_set_var", args: [name, value]);

    return retVal;
  }

  Future<void> delVar(String name) async {
    var retVal = await _session.call("nvim_del_var", args: [name]);

    return retVal;
  }

  Future<dynamic> getVvar(String name) async {
    var retVal = await _session.call("nvim_get_vvar", args: [name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<void> setVvar(String name, dynamic value) async {
    var retVal = await _session.call("nvim_set_vvar", args: [name, value]);

    return retVal;
  }

  Future<dynamic> getOption(String name) async {
    var retVal = await _session.call("nvim_get_option", args: [name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<void> setOption(String name, dynamic value) async {
    var retVal = await _session.call("nvim_set_option", args: [name, value]);

    return retVal;
  }

  Future<void> outWrite(String str) async {
    var retVal = await _session.call("nvim_out_write", args: [str]);

    return retVal;
  }

  Future<void> errWrite(String str) async {
    var retVal = await _session.call("nvim_err_write", args: [str]);

    return retVal;
  }

  Future<void> errWriteln(String str) async {
    var retVal = await _session.call("nvim_err_writeln", args: [str]);

    return retVal;
  }

  Future<List<Buffer>> listBufs() async {
    var retVal = await _session.call("nvim_list_bufs", args: []);

    retVal = List<Buffer>.from(retVal);

    return retVal;
  }

  Future<Buffer> getCurrentBuf() async {
    var retVal = await _session.call("nvim_get_current_buf", args: []);

    retVal = retVal as Buffer;

    return retVal;
  }

  Future<void> setCurrentBuf(Buffer buffer) async {
    var retVal =
        await _session.call("nvim_set_current_buf", args: [buffer.codeData]);

    return retVal;
  }

  Future<List<Window>> listWins() async {
    var retVal = await _session.call("nvim_list_wins", args: []);

    retVal = List<Window>.from(retVal);

    return retVal;
  }

  Future<Window> getCurrentWin() async {
    var retVal = await _session.call("nvim_get_current_win", args: []);

    retVal = retVal as Window;

    return retVal;
  }

  Future<void> setCurrentWin(Window window) async {
    var retVal =
        await _session.call("nvim_set_current_win", args: [window.codeData]);

    return retVal;
  }

  Future<Buffer> createBuf(bool listed, bool scratch) async {
    var retVal =
        await _session.call("nvim_create_buf", args: [listed, scratch]);

    retVal = retVal as Buffer;

    return retVal;
  }

  Future<Window> openWin(
      Buffer buffer, bool enter, Map<dynamic, dynamic> config) async {
    var retVal = await _session
        .call("nvim_open_win", args: [buffer.codeData, enter, config]);

    retVal = retVal as Window;

    return retVal;
  }

  Future<List<Tabpage>> listTabpages() async {
    var retVal = await _session.call("nvim_list_tabpages", args: []);

    retVal = List<Tabpage>.from(retVal);

    return retVal;
  }

  Future<Tabpage> getCurrentTabpage() async {
    var retVal = await _session.call("nvim_get_current_tabpage", args: []);

    retVal = retVal as Tabpage;

    return retVal;
  }

  Future<void> setCurrentTabpage(Tabpage tabpage) async {
    var retVal = await _session
        .call("nvim_set_current_tabpage", args: [tabpage.codeData]);

    return retVal;
  }

  Future<int> createNamespace(String name) async {
    var retVal = await _session.call("nvim_create_namespace", args: [name]);

    retVal = retVal as int;

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getNamespaces() async {
    var retVal = await _session.call("nvim_get_namespaces", args: []);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<bool> paste(String data, bool crlf, int phase) async {
    var retVal = await _session.call("nvim_paste", args: [data, crlf, phase]);

    retVal = retVal as bool;

    return retVal;
  }

  Future<void> put(
      List<String> lines, String type, bool after, bool follow) async {
    var retVal =
        await _session.call("nvim_put", args: [lines, type, after, follow]);

    return retVal;
  }

  Future<void> subscribe(String event) async {
    var retVal = await _session.call("nvim_subscribe", args: [event]);

    return retVal;
  }

  Future<void> unsubscribe(String event) async {
    var retVal = await _session.call("nvim_unsubscribe", args: [event]);

    return retVal;
  }

  Future<int> getColorByName(String name) async {
    var retVal = await _session.call("nvim_get_color_by_name", args: [name]);

    retVal = retVal as int;

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getColorMap() async {
    var retVal = await _session.call("nvim_get_color_map", args: []);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getContext(Map<dynamic, dynamic> opts) async {
    var retVal = await _session.call("nvim_get_context", args: [opts]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<dynamic> loadContext(Map<dynamic, dynamic> dict) async {
    var retVal = await _session.call("nvim_load_context", args: [dict]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getMode() async {
    var retVal = await _session.call("nvim_get_mode", args: []);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<List<Map<dynamic, dynamic>>> getKeymap(String mode) async {
    var retVal = await _session.call("nvim_get_keymap", args: [mode]);

    retVal = List<Map<dynamic, dynamic>>.from(retVal);

    return retVal;
  }

  Future<void> setKeymap(
      String mode, String lhs, String rhs, Map<dynamic, dynamic> opts) async {
    var retVal =
        await _session.call("nvim_set_keymap", args: [mode, lhs, rhs, opts]);

    return retVal;
  }

  Future<void> delKeymap(String mode, String lhs) async {
    var retVal = await _session.call("nvim_del_keymap", args: [mode, lhs]);

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getCommands(Map<dynamic, dynamic> opts) async {
    var retVal = await _session.call("nvim_get_commands", args: [opts]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<List<dynamic>> getApiInfo() async {
    var retVal = await _session.call("nvim_get_api_info", args: []);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  Future<void> setClientInfo(
      String name,
      Map<dynamic, dynamic> version,
      String type,
      Map<dynamic, dynamic> methods,
      Map<dynamic, dynamic> attributes) async {
    var retVal = await _session.call("nvim_set_client_info",
        args: [name, version, type, methods, attributes]);

    return retVal;
  }

  Future<Map<dynamic, dynamic>> getChanInfo(int chan) async {
    var retVal = await _session.call("nvim_get_chan_info", args: [chan]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<List<dynamic>> listChans() async {
    var retVal = await _session.call("nvim_list_chans", args: []);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  Future<List<dynamic>> callAtomic(List<dynamic> calls) async {
    var retVal = await _session.call("nvim_call_atomic", args: [calls]);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  Future<Map<dynamic, dynamic>> parseExpression(
      String expr, String flags, bool highlight) async {
    var retVal = await _session
        .call("nvim_parse_expression", args: [expr, flags, highlight]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  Future<List<dynamic>> listUis() async {
    var retVal = await _session.call("nvim_list_uis", args: []);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  Future<List<dynamic>> getProcChildren(int pid) async {
    var retVal = await _session.call("nvim_get_proc_children", args: [pid]);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  Future<dynamic> getProc(int pid) async {
    var retVal = await _session.call("nvim_get_proc", args: [pid]);

    retVal = retVal as dynamic;

    return retVal;
  }

  Future<void> selectPopupmenuItem(
      int item, bool insert, bool finish, Map<dynamic, dynamic> opts) async {
    var retVal = await _session
        .call("nvim_select_popupmenu_item", args: [item, insert, finish, opts]);

    return retVal;
  }
}
