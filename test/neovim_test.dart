import 'package:dart_nvim_api/dart_nvim_api.dart';
import 'package:test/test.dart';

void main() {
  /* test('calculate', () {
    expect(calculate(), 42);
  }); */
  testUiAttach();
}

Future<void> testUiAttach() async {
  var api = Neovim.fromSession(Session());
  print(await api.listWins());
  test('attaches ui successfully', () async {
    api.ui_attach(50, 50, UiAttachOptions()..rgb = true);
    await Future.delayed(Duration(seconds: 2));
    assert(api.session.pendingNotifications
        .any((notifArr) => notifArr[1] == 'redraw'));
  });
}
