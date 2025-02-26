import 'package:flutter/foundation.dart';
import 'package:pole/core/presentation/theme/colors.dart';
import 'package:pole/core/presentation/theme/dimensions.dart';
import 'package:pole/core/presentation/theme/typography.dart';

@immutable
final class AppTheme {
  final AppColors colors;
  final AppDimensions dimensions;
  final AppTypography typography;

  AppTheme({
    AppColors? colors,
    this.dimensions = const AppDimensions(),
    this.typography = const AppTypography(),
  }) : colors = colors ?? AppColors();
}
