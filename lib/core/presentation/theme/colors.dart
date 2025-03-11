import 'package:flutter/material.dart';

const _EerieBlack = Color(0xFF1E1E1A);
const _DarkLemonLime = Color(0xFF88C025);
const _BlackOlive = Color(0xFF3F3F36);
const _PineTree = Color(0xFF292924);
const _PersianRed = Color(0xFFD73232);
const _Ebony = Color(0xFF555549);
const _TextPrimary = Colors.white;
final _TextSecondary = Colors.white.withAlpha((255 * 0.75).round());
final _TextDisabled = Colors.white.withAlpha((255 * 0.5).round());

@immutable
final class AppColors {
  final Color background;
  final Color error;
  final AppTextColors text;
  final AppButtonColors button;

  AppColors({
    this.background = _EerieBlack,
    this.error = _PersianRed,
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
  final Color disabled;
  final Color background;
  final Color focused;
  final Color unfocused;

  AppTextColors({
    this.primary = _TextPrimary,
    Color? secondary,
    Color? disabled,
    this.background = _PineTree,
    this.focused = _DarkLemonLime,
    this.unfocused = _Ebony,
  }) : secondary = secondary ?? _TextSecondary,
    disabled = disabled ?? _TextDisabled;
}
