import 'package:dart_nvim_api/dart_nvim_api.dart';
import 'package:test/test.dart';

void main() {
  testUiAttach();
}

Future<void> testUiAttach() async {
  var api = Neovim.fromSession(Session());

  test('attaches ui successfully', () async {
    await api.attachUi(
        width: 50, height: 50, options: UiAttachOptions()..rgb = true);

    await Future.delayed(Duration(seconds: 2));

    assert(api.session.pendingNotifications.keys
        .any((notifStr) => notifStr == 'redraw'));
  });
}
