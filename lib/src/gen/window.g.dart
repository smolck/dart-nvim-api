import '../neovim.dart';

extension NvimWindowApi on Nvim {
  Future<List<Window>> tabpageListWins(Tabpage tabpage) {
    return call('nvim_tabpage_list_wins', args: [
      tabpage,
    ]);
  }

  Future<Window> tabpageGetWin(Tabpage tabpage) {
    return call('nvim_tabpage_get_win', args: [
      tabpage,
    ]);
  }

  Future<List<Window>> listWins() {
    return call('nvim_list_wins', args: []);
  }

  Future<Window> getCurrentWin() {
    return call('nvim_get_current_win', args: []);
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
    ]);
  }

  Future<List<int>> winGetCursor(Window window) {
    return call('nvim_win_get_cursor', args: [
      window,
    ]);
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
    ]);
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
    ]);
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

  Future<dynamic> windowSetVar(Window window, String name, dynamic value) {
    return call('window_set_var', args: [
      window,
      name,
      value,
    ]);
  }

  Future<dynamic> windowDelVar(Window window, String name) {
    return call('window_del_var', args: [
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
    ]);
  }

  Future<Tabpage> winGetTabpage(Window window) {
    return call('nvim_win_get_tabpage', args: [
      window,
    ]);
  }

  Future<int> winGetNumber(Window window) {
    return call('nvim_win_get_number', args: [
      window,
    ]);
  }

  Future<bool> winIsValid(Window window) {
    return call('nvim_win_is_valid', args: [
      window,
    ]);
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
    ]);
  }

  Future<void> winClose(Window window, bool force) {
    return call('nvim_win_close', args: [
      window,
      force,
    ]);
  }

  Future<List<Window>> tabpageGetWindows(Tabpage tabpage) {
    return call('tabpage_get_windows', args: [
      tabpage,
    ]);
  }

  Future<Window> tabpageGetWindow(Tabpage tabpage) {
    return call('tabpage_get_window', args: [
      tabpage,
    ]);
  }

  Future<List<Window>> getWindows() {
    return call('vim_get_windows', args: []);
  }

  Future<Window> getCurrentWindow() {
    return call('vim_get_current_window', args: []);
  }

  Future<void> setCurrentWindow(Window window) {
    return call('vim_set_current_window', args: [
      window,
    ]);
  }

  Future<List<int>> windowGetCursor(Window window) {
    return call('window_get_cursor', args: [
      window,
    ]);
  }

  Future<void> windowSetCursor(Window window, List<int> pos) {
    return call('window_set_cursor', args: [
      window,
      pos,
    ]);
  }

  Future<int> windowGetHeight(Window window) {
    return call('window_get_height', args: [
      window,
    ]);
  }

  Future<void> windowSetHeight(Window window, int height) {
    return call('window_set_height', args: [
      window,
      height,
    ]);
  }

  Future<int> windowGetWidth(Window window) {
    return call('window_get_width', args: [
      window,
    ]);
  }

  Future<void> windowSetWidth(Window window, int width) {
    return call('window_set_width', args: [
      window,
      width,
    ]);
  }

  Future<dynamic> windowGetVar(Window window, String name) {
    return call('window_get_var', args: [
      window,
      name,
    ]);
  }

  Future<dynamic> windowGetOption(Window window, String name) {
    return call('window_get_option', args: [
      window,
      name,
    ]);
  }

  Future<void> windowSetOption(Window window, String name, dynamic value) {
    return call('window_set_option', args: [
      window,
      name,
      value,
    ]);
  }

  Future<List<int>> windowGetPosition(Window window) {
    return call('window_get_position', args: [
      window,
    ]);
  }

  Future<Tabpage> windowGetTabpage(Window window) {
    return call('window_get_tabpage', args: [
      window,
    ]);
  }

  Future<bool> windowIsValid(Window window) {
    return call('window_is_valid', args: [
      window,
    ]);
  }
}
