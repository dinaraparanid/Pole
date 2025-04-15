import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/color.dart';
import 'package:pole/di/app_module.dart';
import 'package:pole/feature/root/presentation/bloc/mod.dart';
import 'package:pole/l10n/app_localizations.dart';
import 'package:pole/navigation/app_router.dart';

final class App extends StatelessWidget {
  final router = di<AppRouter>();
  final rootBlocFactory = di<RootBlocFactory>();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = const AppTheme();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
      ),
    );

    return AppThemeProvider(
      theme: theme,
      child: BlocProvider(
        create: (_) => rootBlocFactory.create(),
        child: MaterialApp.router(
          routerConfig: router.value,
          color: theme.colors.background.primary,
          theme: ThemeData(
            splashFactory: InkRipple.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: theme.colors.primary.withRatioOpacity(0.25),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: theme.colors.text.focused,
              selectionColor: theme.colors.text.focused,
              selectionHandleColor: theme.colors.text.focused,
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}