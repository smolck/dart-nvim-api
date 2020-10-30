import '../neovim.dart';

extension NvimTabpageApi on Nvim {
  Future<dynamic> tabpageGetVar(Tabpage tabpage, String name) {
    return call('nvim_tabpage_get_var', args: [
      tabpage,
      name,
    ]);
  }

  Future<void> tabpageSetVar(Tabpage tabpage, String name, dynamic value) {
    return call('nvim_tabpage_set_var', args: [
      tabpage,
      name,
      value,
    ]);
  }

  Future<void> tabpageDelVar(Tabpage tabpage, String name) {
    return call('nvim_tabpage_del_var', args: [
      tabpage,
      name,
    ]);
  }

  Future<dynamic> tabpageSetVar(Tabpage tabpage, String name, dynamic value) {
    return call('tabpage_set_var', args: [
      tabpage,
      name,
      value,
    ]);
  }

  Future<dynamic> tabpageDelVar(Tabpage tabpage, String name) {
    return call('tabpage_del_var', args: [
      tabpage,
      name,
    ]);
  }

  Future<int> tabpageGetNumber(Tabpage tabpage) {
    return call('nvim_tabpage_get_number', args: [
      tabpage,
    ]);
  }

  Future<bool> tabpageIsValid(Tabpage tabpage) {
    return call('nvim_tabpage_is_valid', args: [
      tabpage,
    ]);
  }

  Future<List<Tabpage>> listTabpages() {
    return call('nvim_list_tabpages', args: []);
  }

  Future<Tabpage> getCurrentTabpage() {
    return call('nvim_get_current_tabpage', args: []);
  }

  Future<void> setCurrentTabpage(Tabpage tabpage) {
    return call('nvim_set_current_tabpage', args: [
      tabpage,
    ]);
  }

  Future<dynamic> tabpageGetVar(Tabpage tabpage, String name) {
    return call('tabpage_get_var', args: [
      tabpage,
      name,
    ]);
  }

  Future<bool> tabpageIsValid(Tabpage tabpage) {
    return call('tabpage_is_valid', args: [
      tabpage,
    ]);
  }

  Future<List<Tabpage>> getTabpages() {
    return call('vim_get_tabpages', args: []);
  }

  Future<Tabpage> getCurrentTabpage() {
    return call('vim_get_current_tabpage', args: []);
  }

  Future<void> setCurrentTabpage(Tabpage tabpage) {
    return call('vim_set_current_tabpage', args: [
      tabpage,
    ]);
  }
}
