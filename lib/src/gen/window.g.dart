import '../neovim.dart';
import '../ext_types.dart';

extension NvimWindowApi on Nvim {
  Future<List<Window>> tabpageListWins(Tabpage tabpage) {
    return call('nvim_tabpage_list_wins', args: [
      tabpage,
    ]).then<List<Window>>((v) => (v as List).cast<Window>());
  }

  Future<Window> tabpageGetWin(Tabpage tabpage) {
    return call('nvim_tabpage_get_win', args: [
      tabpage,
    ]).then<Window>((v) => v as Window);
  }

  Future<List<Window>> listWins() {
    return call('nvim_list_wins', args: [])
        .then<List<Window>>((v) => (v as List).cast<Window>());
  }

  Future<Window> getCurrentWin() {
    return call('nvim_get_current_win', args: [])
        .then<Window>((v) => v as Window);
  }

  Future<void> setCurrentWin(Window window) {
    return call('nvim_set_current_win', args: [
      window,
    ]);
  }

  Future<Window> openWin(
      Buffer buffer, bool enter, Map<dynamic, dynamic> config) {
    return call('nvim_open_win', args: [
      buffer,
      enter,
      config,
    ]).then<Window>((v) => v as Window);
  }

  Future<List<int>> winGetCursor(Window window) {
    return call('nvim_win_get_cursor', args: [
      window,
    ]).then<List<int>>((v) => (v as List).cast<int>());
  }

  Future<void> winSetCursor(Window window, List<int> pos) {
    return call('nvim_win_set_cursor', args: [
      window,
      pos,
    ]);
  }

  Future<int> winGetHeight(Window window) {
    return call('nvim_win_get_height', args: [
      window,
    ]).then<int>((v) => v as int);
  }

  Future<void> winSetHeight(Window window, int height) {
    return call('nvim_win_set_height', args: [
      window,
      height,
    ]);
  }

  Future<int> winGetWidth(Window window) {
    return call('nvim_win_get_width', args: [
      window,
    ]).then<int>((v) => v as int);
  }

  Future<void> winSetWidth(Window window, int width) {
    return call('nvim_win_set_width', args: [
      window,
      width,
    ]);
  }

  Future<dynamic> winGetVar(Window window, String name) {
    return call('nvim_win_get_var', args: [
      window,
      name,
    ]);
  }

  Future<void> winSetVar(Window window, String name, dynamic value) {
    return call('nvim_win_set_var', args: [
      window,
      name,
      value,
    ]);
  }

  Future<void> winDelVar(Window window, String name) {
    return call('nvim_win_del_var', args: [
      window,
      name,
    ]);
  }

  Future<dynamic> winGetOption(Window window, String name) {
    return call('nvim_win_get_option', args: [
      window,
      name,
    ]);
  }

  Future<void> winSetOption(Window window, String name, dynamic value) {
    return call('nvim_win_set_option', args: [
      window,
      name,
      value,
    ]);
  }

  Future<List<int>> winGetPosition(Window window) {
    return call('nvim_win_get_position', args: [
      window,
    ]).then<List<int>>((v) => (v as List).cast<int>());
  }

  Future<Tabpage> winGetTabpage(Window window) {
    return call('nvim_win_get_tabpage', args: [
      window,
    ]).then<Tabpage>((v) => v as Tabpage);
  }

  Future<int> winGetNumber(Window window) {
    return call('nvim_win_get_number', args: [
      window,
    ]).then<int>((v) => v as int);
  }

  Future<bool> winIsValid(Window window) {
    return call('nvim_win_is_valid', args: [
      window,
    ]).then<bool>((v) => v as bool);
  }

  Future<void> winSetConfig(Window window, Map<dynamic, dynamic> config) {
    return call('nvim_win_set_config', args: [
      window,
      config,
    ]);
  }

  Future<Map<dynamic, dynamic>> winGetConfig(Window window) {
    return call('nvim_win_get_config', args: [
      window,
    ]).then<Map<dynamic, dynamic>>((v) => v as Map<dynamic, dynamic>);
  }

  Future<void> winClose(Window window, bool force) {
    return call('nvim_win_close', args: [
      window,
      force,
    ]);
  }
}
