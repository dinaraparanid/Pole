import 'package:flutter/cupertino.dart';
import 'package:pole/core/utils/ext/global_key.dart';

final class ExcursionPlaceController {
  final key = GlobalKey();

  Offset? get widgetGlobalPosition => key.globalPosition;
  double? get widgetHeight => key.height;

  double? get widgetGlobalCenterHeight {
    final globalPos = widgetGlobalPosition;
    final height = widgetHeight;

    if (globalPos == null || height == null) {
      return null;
    }

    return globalPos.dy + height / 2;
  }
}
