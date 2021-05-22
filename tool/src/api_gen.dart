import 'dart:io';
import 'dart:convert';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

void main() {
  Map<String, dynamic> apiInfo =
      json.decode(File('tool/src/api_info.json').readAsStringSync());

  var methods =
      apiInfo['functions'].where((x) => x['deprecated_since'] == null);
  var bufMethods = [];
  var winMethods = [];
  var tabpageMethods = [];
  var otherMethods = [];

  for (var method in methods) {
    if (method['name'].contains('buf')) {
      bufMethods.add(method);
    } else if (method['name'].contains('win')) {
      winMethods.add(method);
    } else if (method['name'].contains('tabpage')) {
      tabpageMethods.add(method);
    } else if (method['name'].contains('nvim_')) {
      otherMethods.add(method);
    }
  }

  Library library(dynamic methods) => Library(
      (b) => b.body.addAll(methods.map(infoToMethod).toList().cast<Method>()));

  final emitter = DartEmitter();
  final formatter = DartFormatter();

  final buf = formatter.format(wrapGeneratedCode(
      'NvimBufferApi', '${library(bufMethods).accept(emitter)}'));
  final win = formatter.format(wrapGeneratedCode(
      'NvimWindowApi', '${library(winMethods).accept(emitter)}'));
  final tabpage = formatter.format(wrapGeneratedCode(
      'NvimTabpageApi', '${library(tabpageMethods).accept(emitter)}'));
  final nvim = formatter.format(
      wrapGeneratedCode('NvimApi', '${library(otherMethods).accept(emitter)}'));

  Directory('lib/src/gen')
    ..deleteSync(recursive: true)
    ..createSync();

  // TODO(smolck): Make these files contain extensions on each specific class.
  File('lib/src/gen/nvim.g.dart')
    ..createSync()
    ..writeAsStringSync(nvim);
  File('lib/src/gen/buffer.g.dart')
    ..createSync()
    ..writeAsStringSync(buf);
  File('lib/src/gen/window.g.dart')
    ..createSync()
    ..writeAsStringSync(win);
  File('lib/src/gen/tabpage.g.dart')
    ..createSync()
    ..writeAsStringSync(tabpage);
}

String wrapGeneratedCode(String extensionName, String code) {
  return '''
    import '../neovim.dart';
    import '../ext_types.dart';

    ${/* TODO(smolck): This is just . . . bad */
      extensionName == 'NvimApi' ? '' : 'import \'../ext_types.dart\';'}

    extension ${extensionName} on Nvim {
      ${code}
    }
  ''';
}

String convertInfoName(String name) {
  var parts = name.split('_');
  if (parts[0] == 'nvim' || parts[0] == 'vim') {
    parts = parts.sublist(1);
  }

  parts = [
    parts[0],
    ...parts
        .sublist(1)
        .map((String x) => '${x[0].toUpperCase()}${x.substring(1)}')
  ];

  return parts.join();
}

Method infoToMethod(dynamic info) {
  final typeStr = toDartType(info['return_type']);
  final returnType = TypeReference((b) => b.symbol = 'Future<$typeStr>');

  var typeForCastIfList = typeStr.replaceFirst('List<', '');
  // Remove extra trailing '>'
  typeForCastIfList = typeForCastIfList.replaceRange(
      typeForCastIfList.length - 1, typeForCastIfList.length, '');
  final cast = typeStr.contains('List')
      ? '(v as List).cast<$typeForCastIfList>()'
      : 'v as $typeStr';

  return Method((b) => b
    ..body = Block.of([
      Code("return call('${info['name']}', args: ["),
      ...info['parameters'].map((x) => Code('${x[1]}, ')),
      Code(
          '])${typeStr == 'void' || typeStr == 'dynamic' ? ';' : '.then<$typeStr>((v) => $cast);'}')
    ])
    ..name = convertInfoName(info['name'])
    ..requiredParameters.addAll(info['parameters']
        .map((x) => Parameter((b) => b
          ..name = x[1]
          ..type = TypeReference((b) => b..symbol = toDartType(x[0]))))
        .toList()
        .cast<Parameter>())
    ..returns = returnType);
}

String toDartType(dynamic x) {
  var typeIndex = {
    'Array': 'List<dynamic>',
    'ArrayOf(Integer, 2)': 'List<int>',
    'void': 'void',
    'Integer': 'int',
    'Boolean': 'bool',
    'Float': 'double',
    'String': 'String',
    'Object': 'dynamic',
    'Dictionary': 'Map<dynamic, dynamic>',
    'Window': 'Window',
    'Tabpage': 'Tabpage',
    'Buffer': 'Buffer',
    'LuaRef': 'LuaRef'
  };

  var typeRef = typeIndex[x];
  if (typeRef != null) {
    return typeRef;
  }

  var regex = RegExp('ArrayOf\\(\\s*(\\w+)\\s*\\)');
  if (regex.hasMatch(x)) {
    var match = regex.firstMatch(x)!.group(1);
    return 'List<${typeIndex[match]}>';
  }

  throw 'Bad things happened: $x';
}
