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
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.small),

        Text(
          strings.splash_description,
          textAlign: TextAlign.center,
          style: theme.typography.body.copyWith(
            color: theme.colors.text.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.large),
        
        AppButton(
          onClick: () => onEvent(OnSignUpClick()),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: theme.dimensions.padding.small,
              horizontal: theme.dimensions.padding.medium,
            ),
            child: Text(
              strings.splash_sign_up,
              style: theme.typography.h.h3.copyWith(
                color: theme.colors.text.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        AppButton(
          onClick: () => onEvent(OnSignInClick()),
          backgroundColor: theme.colors.button.secondary,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: theme.dimensions.padding.small,
              horizontal: theme.dimensions.padding.large,
            ),
            child: Text(
              strings.splash_sign_in,
              style: theme.typography.h.h3.copyWith(
                color: theme.colors.text.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
