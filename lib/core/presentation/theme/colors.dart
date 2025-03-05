import 'package:flutter/material.dart';

const _EerieBlack = Color(0xFF1E1E1A);
const _DarkLemonLime = Color(0xFF88C025);
const _BlackOlive = Color(0xFF3F3F36);
const _TextPrimary = Colors.white;
final _TextSecondary = Colors.white.withAlpha((255 * 0.75).round());

@immutable
final class AppColors {
  final Color background;
  final AppTextColors text;
  final AppButtonColors button;

  AppColors({
    this.background = _EerieBlack,
    this.button = const AppButtonColors(),
    AppTextColors? text,
  }) : text = text ?? AppTextColors();
}

@immutable
final class AppButtonColors {
  final Color primary;
  final Color secondary;

  const AppButtonColors({
    this.primary = _DarkLemonLime,
    this.secondary = _BlackOlive,
  });
}

@immutable
final class AppTextColors {
  final Color primary;
  final Color secondary;

  AppTextColors({
    this.primary = _TextPrimary,
    Color? secondary,
  }) : secondary = secondary ?? _TextSecondary;
}
