// Generated 2019-10-23 12:28:11.546414 by `gen_bindings.py`.
// DO NOT MODIFY DIRECTLY!

import 'dart:async';

import 'package:meta/meta.dart';

import 'src/tabpage.dart';
import 'src/window.dart';
import 'src/buffer.dart';
import 'src/session.dart';
import 'src/ui_attach_options.dart';

export 'src/tabpage.dart';
export 'src/window.dart';
export 'src/buffer.dart';
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
    var retVal = await _session.call("nvim_ui_detach", args: []);

    return retVal;
  }

  /// since: 1
  Future<void> uiTryResize(int width, int height) async {
    var retVal =
        await _session.call("nvim_ui_try_resize", args: [width, height]);

    return retVal;
  }

  /// since: 1
  Future<void> uiSetOption(String name, dynamic value) async {
    var retVal = await _session.call("nvim_ui_set_option", args: [name, value]);

    return retVal;
  }

  /// since: 6
  Future<void> uiTryResizeGrid(int grid, int width, int height) async {
    var retVal = await _session
        .call("nvim_ui_try_resize_grid", args: [grid, width, height]);

    return retVal;
  }

  /// since: 6
  Future<void> uiPumSetHeight(int height) async {
    var retVal = await _session.call("nvim_ui_pum_set_height", args: [height]);

    return retVal;
  }

  /// since: 1
  Future<void> command(String command) async {
    var retVal = await _session.call("nvim_command", args: [command]);

    return retVal;
  }

  /// since: 3
  Future<Map<dynamic, dynamic>> getHlByName(String name, bool rgb) async {
    var retVal = await _session.call("nvim_get_hl_by_name", args: [name, rgb]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 3
  Future<Map<dynamic, dynamic>> getHlById(int hl_id, bool rgb) async {
    var retVal = await _session.call("nvim_get_hl_by_id", args: [hl_id, rgb]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<void> feedkeys(String keys, String mode, bool escape_csi) async {
    var retVal =
        await _session.call("nvim_feedkeys", args: [keys, mode, escape_csi]);

    return retVal;
  }

  /// since: 1
  Future<int> input(String keys) async {
    var retVal = await _session.call("nvim_input", args: [keys]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 6
  Future<void> inputMouse(String button, String action, String modifier,
      int grid, int row, int col) async {
    var retVal = await _session.call("nvim_input_mouse",
        args: [button, action, modifier, grid, row, col]);

    return retVal;
  }

  /// since: 1
  Future<String> replaceTermcodes(
      String str, bool from_part, bool do_lt, bool special) async {
    var retVal = await _session
        .call("nvim_replace_termcodes", args: [str, from_part, do_lt, special]);

    retVal = retVal as String;

    return retVal;
  }

  /// since: 1
  Future<String> commandOutput(String command) async {
    var retVal = await _session.call("nvim_command_output", args: [command]);

    retVal = retVal as String;

    return retVal;
  }

  /// since: 1
  Future<dynamic> eval(String expr) async {
    var retVal = await _session.call("nvim_eval", args: [expr]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 3
  Future<dynamic> executeLua(String code, List<dynamic> args) async {
    var retVal = await _session.call("nvim_execute_lua", args: [code, args]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<dynamic> callFunction(String fn, List<dynamic> args) async {
    var retVal = await _session.call("nvim_call_function", args: [fn, args]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 4
  Future<dynamic> callDictFunction(
      dynamic dict, String fn, List<dynamic> args) async {
    var retVal =
        await _session.call("nvim_call_dict_function", args: [dict, fn, args]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<int> strwidth(String text) async {
    var retVal = await _session.call("nvim_strwidth", args: [text]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<List<String>> listRuntimePaths() async {
    var retVal = await _session.call("nvim_list_runtime_paths", args: []);

    retVal = List<String>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<void> setCurrentDir(String dir) async {
    var retVal = await _session.call("nvim_set_current_dir", args: [dir]);

    return retVal;
  }

  /// since: 1
  Future<String> getCurrentLine() async {
    var retVal = await _session.call("nvim_get_current_line", args: []);

    retVal = retVal as String;

    return retVal;
  }

  /// since: 1
  Future<void> setCurrentLine(String line) async {
    var retVal = await _session.call("nvim_set_current_line", args: [line]);

    return retVal;
  }

  /// since: 1
  Future<void> delCurrentLine() async {
    var retVal = await _session.call("nvim_del_current_line", args: []);

    return retVal;
  }

  /// since: 1
  Future<dynamic> getVar(String name) async {
    var retVal = await _session.call("nvim_get_var", args: [name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<void> setVar(String name, dynamic value) async {
    var retVal = await _session.call("nvim_set_var", args: [name, value]);

    return retVal;
  }

  /// since: 1
  Future<void> delVar(String name) async {
    var retVal = await _session.call("nvim_del_var", args: [name]);

    return retVal;
  }

  /// since: 1
  Future<dynamic> getVvar(String name) async {
    var retVal = await _session.call("nvim_get_vvar", args: [name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 6
  Future<void> setVvar(String name, dynamic value) async {
    var retVal = await _session.call("nvim_set_vvar", args: [name, value]);

    return retVal;
  }

  /// since: 1
  Future<dynamic> getOption(String name) async {
    var retVal = await _session.call("nvim_get_option", args: [name]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 1
  Future<void> setOption(String name, dynamic value) async {
    var retVal = await _session.call("nvim_set_option", args: [name, value]);

    return retVal;
  }

  /// since: 1
  Future<void> outWrite(String str) async {
    var retVal = await _session.call("nvim_out_write", args: [str]);

    return retVal;
  }

  /// since: 1
  Future<void> errWrite(String str) async {
    var retVal = await _session.call("nvim_err_write", args: [str]);

    return retVal;
  }

  /// since: 1
  Future<void> errWriteln(String str) async {
    var retVal = await _session.call("nvim_err_writeln", args: [str]);

    return retVal;
  }

  /// since: 1
  Future<List<Buffer>> listBufs() async {
    var retVal = await _session.call("nvim_list_bufs", args: []);

    retVal = List<Buffer>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<Buffer> getCurrentBuf() async {
    var retVal = await _session.call("nvim_get_current_buf", args: []);

    retVal = retVal as Buffer;

    return retVal;
  }

  /// since: 1
  Future<void> setCurrentBuf(Buffer buffer) async {
    var retVal =
        await _session.call("nvim_set_current_buf", args: [buffer.codeData]);

    return retVal;
  }

  /// since: 1
  Future<List<Window>> listWins() async {
    var retVal = await _session.call("nvim_list_wins", args: []);

    retVal = List<Window>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<Window> getCurrentWin() async {
    var retVal = await _session.call("nvim_get_current_win", args: []);

    retVal = retVal as Window;

    return retVal;
  }

  /// since: 1
  Future<void> setCurrentWin(Window window) async {
    var retVal =
        await _session.call("nvim_set_current_win", args: [window.codeData]);

    return retVal;
  }

  /// since: 6
  Future<Buffer> createBuf(bool listed, bool scratch) async {
    var retVal =
        await _session.call("nvim_create_buf", args: [listed, scratch]);

    retVal = retVal as Buffer;

    return retVal;
  }

  /// since: 6
  Future<Window> openWin(
      Buffer buffer, bool enter, Map<dynamic, dynamic> config) async {
    var retVal = await _session
        .call("nvim_open_win", args: [buffer.codeData, enter, config]);

    retVal = retVal as Window;

    return retVal;
  }

  /// since: 1
  Future<List<Tabpage>> listTabpages() async {
    var retVal = await _session.call("nvim_list_tabpages", args: []);

    retVal = List<Tabpage>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<Tabpage> getCurrentTabpage() async {
    var retVal = await _session.call("nvim_get_current_tabpage", args: []);

    retVal = retVal as Tabpage;

    return retVal;
  }

  /// since: 1
  Future<void> setCurrentTabpage(Tabpage tabpage) async {
    var retVal = await _session
        .call("nvim_set_current_tabpage", args: [tabpage.codeData]);

    return retVal;
  }

  /// since: 5
  Future<int> createNamespace(String name) async {
    var retVal = await _session.call("nvim_create_namespace", args: [name]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 5
  Future<Map<dynamic, dynamic>> getNamespaces() async {
    var retVal = await _session.call("nvim_get_namespaces", args: []);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 6
  Future<bool> paste(String data, bool crlf, int phase) async {
    var retVal = await _session.call("nvim_paste", args: [data, crlf, phase]);

    retVal = retVal as bool;

    return retVal;
  }

  /// since: 6
  Future<void> put(
      List<String> lines, String type, bool after, bool follow) async {
    var retVal =
        await _session.call("nvim_put", args: [lines, type, after, follow]);

    return retVal;
  }

  /// since: 1
  Future<void> subscribe(String event) async {
    var retVal = await _session.call("nvim_subscribe", args: [event]);

    return retVal;
  }

  /// since: 1
  Future<void> unsubscribe(String event) async {
    var retVal = await _session.call("nvim_unsubscribe", args: [event]);

    return retVal;
  }

  /// since: 1
  Future<int> getColorByName(String name) async {
    var retVal = await _session.call("nvim_get_color_by_name", args: [name]);

    retVal = retVal as int;

    return retVal;
  }

  /// since: 1
  Future<Map<dynamic, dynamic>> getColorMap() async {
    var retVal = await _session.call("nvim_get_color_map", args: []);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 6
  Future<Map<dynamic, dynamic>> getContext(Map<dynamic, dynamic> opts) async {
    var retVal = await _session.call("nvim_get_context", args: [opts]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 6
  Future<dynamic> loadContext(Map<dynamic, dynamic> dict) async {
    var retVal = await _session.call("nvim_load_context", args: [dict]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 2
  Future<Map<dynamic, dynamic>> getMode() async {
    var retVal = await _session.call("nvim_get_mode", args: []);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 3
  Future<List<Map<dynamic, dynamic>>> getKeymap(String mode) async {
    var retVal = await _session.call("nvim_get_keymap", args: [mode]);

    retVal = List<Map<dynamic, dynamic>>.from(retVal);

    return retVal;
  }

  /// since: 6
  Future<void> setKeymap(
      String mode, String lhs, String rhs, Map<dynamic, dynamic> opts) async {
    var retVal =
        await _session.call("nvim_set_keymap", args: [mode, lhs, rhs, opts]);

    return retVal;
  }

  /// since: 6
  Future<void> delKeymap(String mode, String lhs) async {
    var retVal = await _session.call("nvim_del_keymap", args: [mode, lhs]);

    return retVal;
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> getCommands(Map<dynamic, dynamic> opts) async {
    var retVal = await _session.call("nvim_get_commands", args: [opts]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<List<dynamic>> getApiInfo() async {
    var retVal = await _session.call("nvim_get_api_info", args: []);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  /// since: 4
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

  /// since: 4
  Future<Map<dynamic, dynamic>> getChanInfo(int chan) async {
    var retVal = await _session.call("nvim_get_chan_info", args: [chan]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 4
  Future<List<dynamic>> listChans() async {
    var retVal = await _session.call("nvim_list_chans", args: []);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  /// since: 1
  Future<List<dynamic>> callAtomic(List<dynamic> calls) async {
    var retVal = await _session.call("nvim_call_atomic", args: [calls]);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  /// since: 4
  Future<Map<dynamic, dynamic>> parseExpression(
      String expr, String flags, bool highlight) async {
    var retVal = await _session
        .call("nvim_parse_expression", args: [expr, flags, highlight]);

    retVal = Map<dynamic, dynamic>.from(retVal);

    return retVal;
  }

  /// since: 4
  Future<List<dynamic>> listUis() async {
    var retVal = await _session.call("nvim_list_uis", args: []);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  /// since: 4
  Future<List<dynamic>> getProcChildren(int pid) async {
    var retVal = await _session.call("nvim_get_proc_children", args: [pid]);

    retVal = List<dynamic>.from(retVal);

    return retVal;
  }

  /// since: 4
  Future<dynamic> getProc(int pid) async {
    var retVal = await _session.call("nvim_get_proc", args: [pid]);

    retVal = retVal as dynamic;

    return retVal;
  }

  /// since: 6
  Future<void> selectPopupmenuItem(
      int item, bool insert, bool finish, Map<dynamic, dynamic> opts) async {
    var retVal = await _session
        .call("nvim_select_popupmenu_item", args: [item, insert, finish, opts]);

    return retVal;
  }
}
