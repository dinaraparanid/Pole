import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/di/app_module.dart';
import 'package:pole/navigation/app_router.dart';

final class App extends StatelessWidget {
  final router = di<AppRouter>();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();

    // TODO: cистемные кнопки
    // SystemChrome.setSystemUIOverlayStyle
    
    return AppThemeProvider(
      theme: theme,
      child: MaterialApp.router(
        routerConfig: router.value,
      ),
    );
  }
}