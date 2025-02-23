import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/theme/app.dart';

final class AppThemeProvider extends InheritedWidget {
  final AppTheme theme;

  const AppThemeProvider({super.key, required this.theme, required super.child});

  static AppTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppThemeProvider>()!.theme;

  @override
  bool updateShouldNotify(covariant AppThemeProvider oldWidget) =>
      theme != oldWidget.theme;
}

extension GetAppTheme on BuildContext {
  AppTheme get appTheme => AppThemeProvider.of(this);
}
