import 'package:flutter/cupertino.dart';

extension GlobalKeyExt on GlobalKey {
  Offset? get globalPosition {
    final box = currentContext?.findRenderObject() as RenderBox?;
    return box?.localToGlobal(Offset.zero);
  }

  double? get height {
    final box = currentContext?.findRenderObject() as RenderBox?;
    return box?.size.height;
  }
}
