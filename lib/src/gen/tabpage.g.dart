import '../neovim.dart';
import '../ext_types.dart';

import '../ext_types.dart';

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

  Future<int> tabpageGetNumber(Tabpage tabpage) {
    return call('nvim_tabpage_get_number', args: [
      tabpage,
    ]).then<int>((v) => v as int);
  }

  Future<bool> tabpageIsValid(Tabpage tabpage) {
    return call('nvim_tabpage_is_valid', args: [
      tabpage,
    ]).then<bool>((v) => v as bool);
  }

  Future<List<Tabpage>> listTabpages() {
    return call('nvim_list_tabpages', args: [])
        .then<List<Tabpage>>((v) => (v as List).cast<Tabpage>());
  }

  Future<Tabpage> getCurrentTabpage() {
    return call('nvim_get_current_tabpage', args: [])
        .then<Tabpage>((v) => v as Tabpage);
  }

  Future<void> setCurrentTabpage(Tabpage tabpage) {
    return call('nvim_set_current_tabpage', args: [
      tabpage,
    ]);
  }
}
