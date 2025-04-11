import 'package:flutter/material.dart';
import 'package:pole/core/utils/ext/color.dart';

const _EerieBlack = Color(0xFF1E1E1A);
const _DarkLemonLime = Color(0xFF88C025);
const _DarkLemonLime25 = Color(0x4088C025);
const _DarkLemonLime50 = Color(0x8088C025);
const _BlackOlive = Color(0xFF3F3F36);
const _PineTree = Color(0xFF292924);
const _PersianRed = Color(0xFFD73232);
const _Ebony = Color(0xFF555549);
const _DarkCharcoal = Color(0xFF34342D);
const _TextPrimary = Color(0xFFFFFFFF);
const _TextSecondary = Color(0xBFFFFFFF);
const _TextDisabled = Color(0x80FFFFFF);

@immutable
final class AppColors {
  final Color primary;
  final Color background;
  final Color containerBackground;
  final Color error;
  final AppTextColors text;
  final AppButtonColors button;
  final AppNavigationBarColors navigationBar;
  final AppUniqueComponentsColors uniqueComponents;

  const AppColors({
    this.primary = _DarkLemonLime,
    this.background = _EerieBlack,
    this.containerBackground = _PineTree,
    this.error = _PersianRed,
    this.button = const AppButtonColors(),
    this.uniqueComponents = const AppUniqueComponentsColors(),
    this.text = const AppTextColors(),
    this.navigationBar = const AppNavigationBarColors(),
  });
}

@immutable
final class AppButtonColors {
  final Color primary;
  final Color secondary;
  final Color ripple;

  const AppButtonColors({
    this.primary = _DarkLemonLime,
    this.secondary = _BlackOlive,
    this.ripple = _DarkLemonLime50,
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

  const AppTextColors({
    this.primary = _TextPrimary,
    this.secondary = _TextSecondary,
    this.disabled = _TextDisabled,
    this.background = _PineTree,
    this.focused = _DarkLemonLime,
    this.unfocused = _Ebony,
  });
}

@immutable
final class AppNavigationBarColors {
  final Color background;
  final Color selected;
  final Color unselected;

  const AppNavigationBarColors({
    this.background = _PineTree,
    this.selected = _DarkLemonLime,
    this.unselected = _TextDisabled,
  });
}

@immutable
final class AppUniqueComponentsColors {
  final Color excursionProgressActive;
  final Color excursionProgressPassed;
  final Color excursionProgressLeft;

  final Color excursionTimetableBackground;
  final Color excursionTimetableItemBackground;
  final Color excursionTimetableBorder;

  final Color activeFilter;
  final Color inactiveFilter;

  const AppUniqueComponentsColors({
    this.excursionProgressActive = _DarkLemonLime,
    this.excursionProgressPassed = _DarkLemonLime50,
    this.excursionProgressLeft = _BlackOlive,
    this.excursionTimetableBackground = _EerieBlack,
    this.excursionTimetableItemBackground = _PineTree,
    this.excursionTimetableBorder = _DarkCharcoal,
    this.activeFilter = _DarkLemonLime25,
    this.inactiveFilter = _PineTree,
  });
}
