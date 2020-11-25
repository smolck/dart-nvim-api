import 'package:msgpack_dart/msgpack_dart.dart';
import 'dart:typed_data';

class Buffer {
  final int data;

  Buffer(this.data);
}

class Window {
  final int data;

  Window(this.data);
}

class Tabpage {
  final int data;

  Tabpage(this.data);
}

class ExtTypeDecoder extends ExtDecoder {
  @override
  dynamic decodeObject(int extType, Uint8List data) {
    switch (extType) {
      case 0: // ID for a `Buffer`
        return Buffer(deserialize(data));
      case 1: // ID for a `Window`
        return Window(deserialize(data));
      case 2: // ID for a `Tabpage`
        return Tabpage(deserialize(data));
    }
  }
}

class ExtTypeEncoder extends ExtEncoder {
  @override
  int extTypeForObject(dynamic object) {
    if (object is Buffer) {
      return 0;
    } else if (object is Window) {
      return 1;
    } else if (object is Tabpage) {
      return 2;
    }

    throw "Can't decode object, not a Neovim type: $object";
  }

  @override
  Uint8List encodeObject(dynamic object) {
    if (object is Buffer || object is Window || object is Tabpage) {
      return serialize(object.data);
    }

    throw "Object wasn't a Neovim ext type!";
  }
}
