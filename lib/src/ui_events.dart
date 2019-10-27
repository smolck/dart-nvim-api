import 'package:dart_nvim_api/dart_nvim_api.dart';

/// Returns the corresponding event class, initialized with
/// `params`, for the [String] `eventName`. Assumes the length
/// of `params` is the same as that of the actual Neovim ui_event.
dynamic uiEvent(String eventName, List<dynamic> params) {
  switch (eventName) {
    case 'mode_info_set':
      return ModeInfoSet(
        params[0],
        params[1],
      );
    case 'update_menu':
      return UpdateMenu();
    case 'busy_start':
      return BusyStart();
    case 'busy_stop':
      return BusyStop();
    case 'mouse_on':
      return MouseOn();
    case 'mouse_off':
      return MouseOff();
    case 'mode_change':
      return ModeChange(
        params[0],
        params[1],
      );
    case 'bell':
      return Bell();
    case 'visual_bell':
      return VisualBell();
    case 'flush':
      return Flush();
    case 'suspend':
      return Suspend();
    case 'set_title':
      return SetTitle(
        params[0],
      );
    case 'set_icon':
      return SetIcon(
        params[0],
      );
    case 'option_set':
      return OptionSet(
        params[0],
        params[1],
      );
    case 'update_fg':
      return UpdateFg(
        params[0],
      );
    case 'update_bg':
      return UpdateBg(
        params[0],
      );
    case 'update_sp':
      return UpdateSp(
        params[0],
      );
    case 'resize':
      return Resize(
        params[0],
        params[1],
      );
    case 'clear':
      return Clear();
    case 'eol_clear':
      return EolClear();
    case 'cursor_goto':
      return CursorGoto(
        params[0],
        params[1],
      );
    case 'highlight_set':
      return HighlightSet(
        params[0],
      );
    case 'put':
      return Put(
        params[0],
      );
    case 'set_scroll_region':
      return SetScrollRegion(
        params[0],
        params[1],
        params[2],
        params[3],
      );
    case 'scroll':
      return Scroll(
        params[0],
      );
    case 'default_colors_set':
      return DefaultColorsSet(
        params[0],
        params[1],
        params[2],
        params[3],
        params[4],
      );
    case 'hl_attr_define':
      return HlAttrDefine(
        params[0],
        params[1],
        params[2],
        params[3],
      );
    case 'hl_group_set':
      return HlGroupSet(
        params[0],
        params[1],
      );
    case 'grid_resize':
      return GridResize(
        params[0],
        params[1],
        params[2],
      );
    case 'grid_clear':
      return GridClear(
        params[0],
      );
    case 'grid_cursor_goto':
      return GridCursorGoto(
        params[0],
        params[1],
        params[2],
      );
    case 'grid_line':
      return GridLine(
        params[0],
        params[1],
        params[2],
        params[3],
      );
    case 'grid_scroll':
      return GridScroll(
        params[0],
        params[1],
        params[2],
        params[3],
        params[4],
        params[5],
        params[6],
      );
    case 'grid_destroy':
      return GridDestroy(
        params[0],
      );
    case 'win_pos':
      return WinPos(
        params[0],
        params[1],
        params[2],
        params[3],
        params[4],
        params[5],
      );
    case 'win_float_pos':
      return WinFloatPos(
        params[0],
        params[1],
        params[2],
        params[3],
        params[4],
        params[5],
        params[6],
      );
    case 'win_external_pos':
      return WinExternalPos(
        params[0],
        params[1],
      );
    case 'win_hide':
      return WinHide(
        params[0],
      );
    case 'win_close':
      return WinClose(
        params[0],
      );
    case 'msg_set_pos':
      return MsgSetPos(
        params[0],
        params[1],
        params[2],
        params[3],
      );
    case 'popupmenu_show':
      return PopupmenuShow(
        params[0],
        params[1],
        params[2],
        params[3],
        params[4],
      );
    case 'popupmenu_hide':
      return PopupmenuHide();
    case 'popupmenu_select':
      return PopupmenuSelect(
        params[0],
      );
    case 'tabline_update':
      return TablineUpdate(
        params[0],
        params[1],
      );
    case 'cmdline_show':
      return CmdlineShow(
        params[0],
        params[1],
        params[2],
        params[3],
        params[4],
        params[5],
      );
    case 'cmdline_pos':
      return CmdlinePos(
        params[0],
        params[1],
      );
    case 'cmdline_special_char':
      return CmdlineSpecialChar(
        params[0],
        params[1],
        params[2],
      );
    case 'cmdline_hide':
      return CmdlineHide(
        params[0],
      );
    case 'cmdline_block_show':
      return CmdlineBlockShow(
        params[0],
      );
    case 'cmdline_block_append':
      return CmdlineBlockAppend(
        params[0],
      );
    case 'cmdline_block_hide':
      return CmdlineBlockHide();
    case 'wildmenu_show':
      return WildmenuShow(
        params[0],
      );
    case 'wildmenu_select':
      return WildmenuSelect(
        params[0],
      );
    case 'wildmenu_hide':
      return WildmenuHide();
    case 'msg_show':
      return MsgShow(
        params[0],
        params[1],
        params[2],
      );
    case 'msg_clear':
      return MsgClear();
    case 'msg_showcmd':
      return MsgShowcmd(
        params[0],
      );
    case 'msg_showmode':
      return MsgShowmode(
        params[0],
      );
    case 'msg_ruler':
      return MsgRuler(
        params[0],
      );
    case 'msg_history_show':
      return MsgHistoryShow(
        params[0],
      );
  }
}

class ModeInfoSet {
  bool enabled;
  List<dynamic> cursor_styles;

  ModeInfoSet(
    this.enabled,
    this.cursor_styles,
  );
}

class UpdateMenu {
  UpdateMenu();
}

class BusyStart {
  BusyStart();
}

class BusyStop {
  BusyStop();
}

class MouseOn {
  MouseOn();
}

class MouseOff {
  MouseOff();
}

class ModeChange {
  String mode;
  int mode_idx;

  ModeChange(
    this.mode,
    this.mode_idx,
  );
}

class Bell {
  Bell();
}

class VisualBell {
  VisualBell();
}

class Flush {
  Flush();
}

class Suspend {
  Suspend();
}

class SetTitle {
  String title;

  SetTitle(
    this.title,
  );
}

class SetIcon {
  String icon;

  SetIcon(
    this.icon,
  );
}

class OptionSet {
  String name;
  dynamic value;

  OptionSet(
    this.name,
    this.value,
  );
}

class UpdateFg {
  int fg;

  UpdateFg(
    this.fg,
  );
}

class UpdateBg {
  int bg;

  UpdateBg(
    this.bg,
  );
}

class UpdateSp {
  int sp;

  UpdateSp(
    this.sp,
  );
}

class Resize {
  int width;
  int height;

  Resize(
    this.width,
    this.height,
  );
}

class Clear {
  Clear();
}

class EolClear {
  EolClear();
}

class CursorGoto {
  int row;
  int col;

  CursorGoto(
    this.row,
    this.col,
  );
}

class HighlightSet {
  Map<dynamic, dynamic> attrs;

  HighlightSet(
    this.attrs,
  );
}

class Put {
  String str;

  Put(
    this.str,
  );
}

class SetScrollRegion {
  int top;
  int bot;
  int left;
  int right;

  SetScrollRegion(
    this.top,
    this.bot,
    this.left,
    this.right,
  );
}

class Scroll {
  int count;

  Scroll(
    this.count,
  );
}

class DefaultColorsSet {
  int rgb_fg;
  int rgb_bg;
  int rgb_sp;
  int cterm_fg;
  int cterm_bg;

  DefaultColorsSet(
    this.rgb_fg,
    this.rgb_bg,
    this.rgb_sp,
    this.cterm_fg,
    this.cterm_bg,
  );
}

class HlAttrDefine {
  int id;
  Map<dynamic, dynamic> rgb_attrs;
  Map<dynamic, dynamic> cterm_attrs;
  List<dynamic> info;

  HlAttrDefine(
    this.id,
    this.rgb_attrs,
    this.cterm_attrs,
    this.info,
  );
}

class HlGroupSet {
  String name;
  int id;

  HlGroupSet(
    this.name,
    this.id,
  );
}

class GridResize {
  int grid;
  int width;
  int height;

  GridResize(
    this.grid,
    this.width,
    this.height,
  );
}

class GridClear {
  int grid;

  GridClear(
    this.grid,
  );
}

class GridCursorGoto {
  int grid;
  int row;
  int col;

  GridCursorGoto(
    this.grid,
    this.row,
    this.col,
  );
}

class GridLine {
  int grid;
  int row;
  int col_start;
  List<dynamic> data;

  GridLine(
    this.grid,
    this.row,
    this.col_start,
    this.data,
  );
}

class GridScroll {
  int grid;
  int top;
  int bot;
  int left;
  int right;
  int rows;
  int cols;

  GridScroll(
    this.grid,
    this.top,
    this.bot,
    this.left,
    this.right,
    this.rows,
    this.cols,
  );
}

class GridDestroy {
  int grid;

  GridDestroy(
    this.grid,
  );
}

class WinPos {
  int grid;
  Window win;
  int startrow;
  int startcol;
  int width;
  int height;

  WinPos(
    this.grid,
    this.win,
    this.startrow,
    this.startcol,
    this.width,
    this.height,
  );
}

class WinFloatPos {
  int grid;
  Window win;
  String anchor;
  int anchor_grid;
  double anchor_row;
  double anchor_col;
  bool focusable;

  WinFloatPos(
    this.grid,
    this.win,
    this.anchor,
    this.anchor_grid,
    this.anchor_row,
    this.anchor_col,
    this.focusable,
  );
}

class WinExternalPos {
  int grid;
  Window win;

  WinExternalPos(
    this.grid,
    this.win,
  );
}

class WinHide {
  int grid;

  WinHide(
    this.grid,
  );
}

class WinClose {
  int grid;

  WinClose(
    this.grid,
  );
}

class MsgSetPos {
  int grid;
  int row;
  bool scrolled;
  String sep_char;

  MsgSetPos(
    this.grid,
    this.row,
    this.scrolled,
    this.sep_char,
  );
}

class PopupmenuShow {
  List<dynamic> items;
  int selected;
  int row;
  int col;
  int grid;

  PopupmenuShow(
    this.items,
    this.selected,
    this.row,
    this.col,
    this.grid,
  );
}

class PopupmenuHide {
  PopupmenuHide();
}

class PopupmenuSelect {
  int selected;

  PopupmenuSelect(
    this.selected,
  );
}

class TablineUpdate {
  Tabpage current;
  List<dynamic> tabs;

  TablineUpdate(
    this.current,
    this.tabs,
  );
}

class CmdlineShow {
  List<dynamic> content;
  int pos;
  String firstc;
  String prompt;
  int indent;
  int level;

  CmdlineShow(
    this.content,
    this.pos,
    this.firstc,
    this.prompt,
    this.indent,
    this.level,
  );
}

class CmdlinePos {
  int pos;
  int level;

  CmdlinePos(
    this.pos,
    this.level,
  );
}

class CmdlineSpecialChar {
  String c;
  bool shift;
  int level;

  CmdlineSpecialChar(
    this.c,
    this.shift,
    this.level,
  );
}

class CmdlineHide {
  int level;

  CmdlineHide(
    this.level,
  );
}

class CmdlineBlockShow {
  List<dynamic> lines;

  CmdlineBlockShow(
    this.lines,
  );
}

class CmdlineBlockAppend {
  List<dynamic> lines;

  CmdlineBlockAppend(
    this.lines,
  );
}

class CmdlineBlockHide {
  CmdlineBlockHide();
}

class WildmenuShow {
  List<dynamic> items;

  WildmenuShow(
    this.items,
  );
}

class WildmenuSelect {
  int selected;

  WildmenuSelect(
    this.selected,
  );
}

class WildmenuHide {
  WildmenuHide();
}

class MsgShow {
  String kind;
  List<dynamic> content;
  bool replace_last;

  MsgShow(
    this.kind,
    this.content,
    this.replace_last,
  );
}

class MsgClear {
  MsgClear();
}

class MsgShowcmd {
  List<dynamic> content;

  MsgShowcmd(
    this.content,
  );
}

class MsgShowmode {
  List<dynamic> content;

  MsgShowmode(
    this.content,
  );
}

class MsgRuler {
  List<dynamic> content;

  MsgRuler(
    this.content,
  );
}

class MsgHistoryShow {
  List<dynamic> entries;

  MsgHistoryShow(
    this.entries,
  );
}
