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
          style: theme.typography.h.h2.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.small),

        Text(
          strings.splash_description,
          textAlign: TextAlign.center,
          style: theme.typography.h.h4.copyWith(
            color: theme.colors.text.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.extraMedium),
        
        AppButton(
          onClick: () => onEvent(OnBeginJourneyClick()),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: theme.dimensions.padding.small,
              horizontal: theme.dimensions.padding.medium,
            ),
            child: Text(
              strings.splash_begin_journey,
              style: theme.typography.regular.copyWith(
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
