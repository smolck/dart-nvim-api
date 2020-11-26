import 'package:dart_nvim_api/dart_nvim_api.dart';
import 'package:test/test.dart';

void main() async {
  var nvim = await Nvim.spawn();

  test('evaluating 1 + 1 should equal 2', () async {
    assert(await nvim.eval('1 + 1') == 2);
  });

  test('buffers work', () async {
    var buf = await nvim.createBuf(true, false);

    assert((await nvim.bufGetLines(buf, 0, -1, false)).length == 1);
    assert((await nvim.bufGetName(buf)).isEmpty);

    var nameWithoutPath = 'this is a name';
    await nvim.bufSetName(buf, nameWithoutPath);
    assert((await nvim.bufGetName(buf)).contains(nameWithoutPath));
  });

  test('windows work', () async {
    var winBuf = await nvim.createBuf(true, false);
    var win = await nvim.openWin(winBuf, true, {
      'relative': 'editor',
      'width': 12,
      'height': 10,
      'row': 10,
      'col': 10
    });

    assert(await nvim.winGetWidth(win) == 12);
    assert(await nvim.winGetHeight(win) == 10);
  });

  // TODO(smolck): Test tabs?

  // TODO(smolck): Should maybe kill Neovim but not quite sure how to do
  // that with the async main function.
  // nvim.kill();
}
