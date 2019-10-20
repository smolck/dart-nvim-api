class UiAttachOptions {
  Map<String, bool> _opts;

  bool get rgb => _opts["rgb"] ?? false;
  set rgb(bool val) => _opts["rgb"] = val;

  bool get extPopupmenu => _opts["ext_popupmenu"] ?? false;
  set extPopupmenu(bool val) => _opts["ext_popupmenu"] = val;

  bool get extTabline => _opts["ext_tabline"] ?? false;
  set extTabline(bool val) => _opts["ext_tabline"] = val;

  bool get extCmdline => _opts["ext_cmdline"] ?? false;
  set extCmdline(bool val) => _opts["ext_cmdline"] = val;

  bool get extWildmenu => _opts["ext_wildmenu"] ?? false;
  set extWildmenu(bool val) => _opts["ext_wildmenu"] = val;

  bool get extLinegrid => _opts["ext_linegrid"] ?? false;
  set extLinegrid(bool val) => _opts["ext_linegrid"] = val;

  bool get extHlstate => _opts["ext_hlstate"] ?? false;
  set extHlstate(bool val) => _opts["ext_hlstate"] = val;

  bool get extTermColors => _opts["ext_termcolors"] ?? false;
  set extTermColors(bool val) => _opts["ext_termcolors"] = val;

  bool get extMessages => _opts["ext_messages"] ?? false;
  set extMessages(bool val) => _opts["ext_messages"] = val;

  UiAttachOptions() : _opts = {};

  Map<String, bool> asMap() => _opts;
}
