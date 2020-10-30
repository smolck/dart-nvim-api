import 'package:dart_nvim_api/dart_nvim_api.dart';
import 'package:test/test.dart';

void main() async {
  test('Do stuff', doStuff);
}

Future<void> doStuff() async {
  var nvim = await Nvim.spawn(onNotify: (nvim, method, args) {
    print('NOTIFY: $nvim $method $args');
  }, onRequest: (nvim, method, args) {
    print('REQUEST: $nvim $method $args');
  });

  print('eval: ${await nvim.eval('1 + 1')}');

  assert(false);
  // assert(await nvim.call('nvim_eval', args: ['2 + 2']) == 4);
}
