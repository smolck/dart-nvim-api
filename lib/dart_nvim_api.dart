// Generated 2019-10-23 12:28:11.546414 by `gen_bindings.py`.
// DO NOT MODIFY DIRECTLY!

import 'dart:async';

import 'package:meta/meta.dart';

import 'src/tabpage.dart';
import 'src/window.dart';
import 'src/buffer.dart';
import 'src/ui_events.dart';
import 'src/session.dart';
import 'src/ui_attach_options.dart';

export 'src/tabpage.dart';
export 'src/window.dart';
export 'src/buffer.dart';
export 'src/ui_events.dart';
export 'src/session.dart';
export 'src/ui_attach_options.dart';

/// Represents an instance of Neovim which can be communicated with via
/// methods.
class Neovim {
  Session _session;

  /// The Neovim session, which holds information such as pending
  /// requests, responses, and notifications from Neovim, and which
  /// also allows for direct communication with Neovim. See [Session]
  /// class for more details.
  get session => _session;

  /// Create a Neovim instance from a [Session] instance.
  Neovim.fromSession(this._session);

  /// Communicate over TCP with an already-running Neovim instance
  /// (i.e. a Neovim instance run with `--listen <host>:<port>`).
  Neovim.connectToRunningInstance({
    @required String host,
    @required int port,
  }) : _session = Session.fromRunningInstance(host: host, port: port);
  Neovim({String nvimBinaryPath})
      : _session = Session(nvim: nvimBinaryPath ?? '/usr/bin/nvim');

  /// From Neovim's `:help nvim_ui_attach()` documentation:
  /// "Activates UI events on the channel."
  ///
  /// "Entry point of all UI clients. Allows |--embed| to continue
  /// startup. Implies that the client is ready to show the UI. Adds
  /// the client to the list of UIs. |nvim_list_uis()|"
  ///
  /// `width` and `height` are the requested screen columns and rows of the
  /// Neovim session, respectively.
  ///
  /// `options` is an instance of [UiAttachOptions], which contains information
  /// related to the UI; see Neovim's `:help ui-option` documentation.
  Future attachUi(
      {@required int width,
      @required int height,
      UiAttachOptions options}) async {
    return await _session
        .call("nvim_ui_attach", args: [width, height, options?.asMap()]);
  }

  /// since: 1
  Future<void> uiDetach() async {
    return _session.call<void>("nvim_ui_detach", args: []);
  }

  /// since: 1
  Future<void> uiTryResize(int width, int height) async {
    return _session.call<void>("nvim_ui_try_resize", args: [width, height]);
  }

  /// since: 1
  Future<void> uiSetOption(String name, dynamic value) async {
    return _session.call<void>("nvim_ui_set_option", args: [name, value]);
  }

  /// since: 6
  Future<void> uiTryResizeGrid(int grid, int width, int height) async {
    return _session
        .call<void>("nvim_ui_try_resize_grid", args: [grid, width, height]);
  }

  /// since: 6
  Future<void> uiPumSetHeight(int height) async {
    return _session.call<void>("nvim_ui_pum_set_height", args: [height]);
  }

  /// since: 1
  Future<void> command(String command) async {
    return _session.call<void>("nvim_command", args: [command]);
  }

  /// since: 3
  Future<Map<dynamic, dynamic>> getHlByName(String name, bool rgb) async {
    return _session
        .call<Map<dynamic, dynamic>>("nvim_get_hl_by_name", args: [name, rgb]);
  }

  /// since: 3
  Future<Map<dynamic, dynamic>> getHlById(int hl_id, bool rgb) async {
    return _session
        .call<Map<dynamic, dynamic>>("nvim_get_hl_by_id", args: [hl_id, rgb]);
  }

  /// since: 1
  Future<void> feedkeys(String keys, String mode, bool escape_csi) async {
    return _session.call<void>("nvim_feedkeys", args: [keys, mode, escape_csi]);
  }

  /// since: 1
  Future<int> input(String keys) async {
    return _session.call<int>("nvim_input", args: [keys]);
  }

  /// since: 6
  Future<void> inputMouse(String button, String action, String modifier,
      int grid, int row, int col) async {
    return _session.call<void>("nvim_input_mouse",
        args: [button, action, modifier, grid, row, col]);
  }

  /// since: 1
  Future<String> replaceTermcodes(
      String str, bool from_part, bool do_lt, bool special) async {
    return _session.call<String>("nvim_replace_termcodes",
        args: [str, from_part, do_lt, special]);
  }

  /// since: 1
  Future<String> commandOutput(String command) async {
    return _session.call<String>("nvim_command_output", args: [command]);
  }

  /// since: 1
  Future<dynamic> eval(String expr) async {
    return _session.call<dynamic>("nvim_eval", args: [expr]);
  }

  /// since: 3
  Future<dynamic> executeLua(String code, List<dynamic> args) async {
    return _session.call<dynamic>("nvim_execute_lua", args: [code, args]);
  }

  /// since: 1
  Future<dynamic> callFunction(String fn, List<dynamic> args) async {
    return _session.call<dynamic>("nvim_call_function", args: [fn, args]);
  }

  /// since: 4
  Future<dynamic> callDictFunction(
      dynamic dict, String fn, List<dynamic> args) async {
    return _session
        .call<dynamic>("nvim_call_dict_function", args: [dict, fn, args]);
  }

  /// since: 1
  Future<int> strwidth(String text) async {
    return _session.call<int>("nvim_strwidth", args: [text]);
  }

  /// since: 1
  Future<List<String>> listRuntimePaths() async {
    return _session.call<List<String>>("nvim_list_runtime_paths", args: []);
  }

  /// since: 1
  Future<void> setCurrentDir(String dir) async {
    return _session.call<void>("nvim_set_current_dir", args: [dir]);
  }

  /// since: 1
  Future<String> getCurrentLine() async {
    return _session.call<String>("nvim_get_current_line", args: []);
  }

  /// since: 1
  Future<void> setCurrentLine(String line) async {
    return _session.call<void>("nvim_set_current_line", args: [line]);
  }

  /// since: 1
  Future<void> delCurrentLine() async {
    return _session.call<void>("nvim_del_current_line", args: []);
  }

  /// since: 1
  Future<dynamic> getVar(String name) async {
    return _session.call<dynamic>("nvim_get_var", args: [name]);
  }

  /// since: 1
  Future<void> setVar(String name, dynamic value) async {
    return _session.call<void>("nvim_set_var", args: [name, value]);
  }

  /// since: 1
  Future<void> delVar(String name) async {
    return _session.call<void>("nvim_del_var", args: [name]);
  }

  /// since: 1
  Future<dynamic> getVvar(String name) async {
    return _session.call<dynamic>("nvim_get_vvar", args: [name]);
  }

  /// since: 6
  Future<void> setVvar(String name, dynamic value) async {
    return _session.call<void>("nvim_set_vvar", args: [name, value]);
  }

  /// since: 1
  Future<dynamic> getOption(String name) async {
    return _session.call<dynamic>("nvim_get_option", args: [name]);
  }

  /// since: 1
  Future<void> setOption(String name, dynamic value) async {
    return _session.call<void>("nvim_set_option", args: [name, value]);
  }

  /// since: 1
  Future<void> outWrite(String str) async {
    return _session.call<void>("nvim_out_write", args: [str]);
  }

  /// since: 1
  Future<void> errWrite(String str) async {
    return _session.call<void>("nvim_err_write", args: [str]);
  }

  /// since: 1
  Future<void> errWriteln(String str) async {
    return _session.call<void>("nvim_err_writeln", args: [str]);
  }

  /// since: 1
  Future<List<Buffer>> listBufs() async {
    return _session.call<List<Buffer>>("nvim_list_bufs", args: []);
  }

  /// since: 1
  Future<Buffer> getCurrentBuf() async {
    return _session.call<Buffer>("nvim_get_current_buf", args: []);
  }

  /// since: 1
  Future<void> setCurrentBuf(Buffer buffer) async {
    return _session.call<void>("nvim_set_current_buf", args: [buffer.codeData]);
  }

  /// since: 1
  Future<List<Window>> listWins() async {
    return _session.call<List<Window>>("nvim_list_wins", args: []);
  }

  /// since: 1
  Future<Window> getCurrentWin() async {
    return _session.call<Window>("nvim_get_current_win", args: []);
  }

  /// since: 1
  Future<void> setCurrentWin(Window window) async {
    return _session.call<void>("nvim_set_current_win", args: [window.codeData]);
  }

  /// since: 6
  Future<Buffer> createBuf(bool listed, bool scratch) async {
    return _session.call<Buffer>("nvim_create_buf", args: [listed, scratch]);
  }

  /// since: 6
  Future<Window> openWin(
      Buffer buffer, bool enter, Map<dynamic, dynamic> config) async {
    return _session
        .call<Window>("nvim_open_win", args: [buffer.codeData, enter, config]);
  }

  /// since: 1
  Future<List<Tabpage>> listTabpages() async {
    return _session.call<List<Tabpage>>("nvim_list_tabpages", args: []);
  }

  /// since: 1
  Future<Tabpage> getCurrentTabpage() async {
    return _session.call<Tabpage>("nvim_get_current_tabpage", args: []);
  }

  /// since: 1
  Future<void> setCurrentTabpage(Tabpage tabpage) async {
    return _session
        .call<void>("nvim_set_current_tabpage", args: [tabpage.codeData]);
  }

  /// since: 5
  Future<int> createNamespace(String name) async {
    return _session.call<int>("nvim_create_namespace", args: [name]);
  }

  /// since: 5
  Future<Map<dynamic, dynamic>> getNamespaces() async {
    return _session
        .call<Map<dynamic, dynamic>>("nvim_get_namespaces", args: []);
  }

  /// since: 6
  Future<bool> paste(String data, bool crlf, int phase) async {
    return _session.call<bool>("nvim_paste", args: [data, crlf, phase]);
  }

  /// since: 6
  Future<void> put(
      List<String> lines, String type, bool after, bool follow) async {
    return _session.call<void>("nvim_put", args: [lines, type, after, follow]);
  }

  /// since: 1
  Future<void> subscribe(String event) async {
    return _session.call<void>("nvim_subscribe", args: [event]);
  }

  /// since: 1
  Future<void> unsubscribe(String event) async {
    return _session.call<void>("nvim_unsubscribe", args: [event]);
  }

  /// since: 1
  Future<int> getColorByName(String name) async {
    return _session.call<int>("nvim_get_color_by_name", args: [name]);
  }

  /// since: 1
  Future<Map<dynamic, dynamic>> getColorMap() async {
    return _session.call<Map<dynamic, dynamic>>("nvim_get_color_map", args: []);
  }

  /// since: 6
  Future<Map<dynamic, dynamic>> getContext(Map<dynamic, dynamic> opts) async {
    return _session
        .call<Map<dynamic, dynamic>>("nvim_get_context", args: [opts]);
  }

  /// since: 6
  Future<dynamic> loadContext(Map<dynamic, dynamic> dict) async {
    return _session.call<dynamic>("nvim_load_context", args: [dict]);
  }

  /// since: 2
  Future<Map<dynamic, dynamic>> getMode() async {
    return _session.call<Map<dynamic, dynamic>>("nvim_get_mode", args: []);
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> getKeymap(String mode) async {
    return _session
        .call<List<Map<dynamic, dynamic>>>("nvim_get_keymap", args: [mode]);
  }

  /// since: 6
  Future<void> setKeymap(
      String mode, String lhs, String rhs, Map<dynamic, dynamic> opts) async {
    return _session.call<void>("nvim_set_keymap", args: [mode, lhs, rhs, opts]);
  }

  /// since: 6
  Future<void> delKeymap(String mode, String lhs) async {
    return _session.call<void>("nvim_del_keymap", args: [mode, lhs]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> getCommands(Map<dynamic, dynamic> opts) async {
    return _session
        .call<Map<dynamic, dynamic>>("nvim_get_commands", args: [opts]);
  }

  /// since: 1
  Future<List<dynamic>> getApiInfo() async {
    return _session.call<List<dynamic>>("nvim_get_api_info", args: []);
  }

  /// since: 4
  Future<void> setClientInfo(
      String name,
      Map<dynamic, dynamic> version,
      String type,
      Map<dynamic, dynamic> methods,
      Map<dynamic, dynamic> attributes) async {
    return _session.call<void>("nvim_set_client_info",
        args: [name, version, type, methods, attributes]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> getChanInfo(int chan) async {
    return _session
        .call<Map<dynamic, dynamic>>("nvim_get_chan_info", args: [chan]);
  }

  /// since: 4
  Future<List<dynamic>> listChans() async {
    return _session.call<List<dynamic>>("nvim_list_chans", args: []);
  }

  /// since: 1
  Future<List<dynamic>> callAtomic(List<dynamic> calls) async {
    return _session.call<List<dynamic>>("nvim_call_atomic", args: [calls]);
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> parseExpression(
      String expr, String flags, bool highlight) async {
    return _session.call<Map<dynamic, dynamic>>("nvim_parse_expression",
        args: [expr, flags, highlight]);
  }

  /// since: 4
  Future<List<dynamic>> listUis() async {
    return _session.call<List<dynamic>>("nvim_list_uis", args: []);
  }

  /// since: 4
  Future<List<dynamic>> getProcChildren(int pid) async {
    return _session.call<List<dynamic>>("nvim_get_proc_children", args: [pid]);
  }

  /// since: 4
  Future<dynamic> getProc(int pid) async {
    return _session.call<dynamic>("nvim_get_proc", args: [pid]);
  }

  /// since: 6
  Future<void> selectPopupmenuItem(
      int item, bool insert, bool finish, Map<dynamic, dynamic> opts) async {
    return _session.call<void>("nvim_select_popupmenu_item",
        args: [item, insert, finish, opts]);
  }
}
