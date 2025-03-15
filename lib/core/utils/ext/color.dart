import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color withRatioOpacity(double ratio) => withAlpha((255 * ratio).round());
}
