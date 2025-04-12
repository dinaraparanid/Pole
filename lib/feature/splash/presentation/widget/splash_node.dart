import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_event.dart';

final class SplashNode extends StatelessWidget {
  final void Function(SplashEvent) onEvent;
  const SplashNode({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          strings.splash_title,
          textAlign: TextAlign.center,
          style: theme.typography.h.h3.copyWith(
            color: theme.colors.text.primary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.small),

        Text(
          strings.splash_description,
          textAlign: TextAlign.center,
          style: theme.typography.body.copyWith(
            color: theme.colors.text.secondary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.large),

        AppButton(
          text: strings.splash_sign_up,
          onClick: () => onEvent(OnSignUpClick()),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        AppButton(
          text: strings.splash_sign_in,
          onClick: () => onEvent(OnSignInClick()),
          enabledColor: theme.colors.button.secondary,
        ),
      ],
    );
  }
}
