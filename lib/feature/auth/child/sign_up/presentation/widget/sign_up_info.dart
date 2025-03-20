import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';

final class SignUpInfo extends StatelessWidget {
  final void Function(SignUpEvent) onEvent;
  const SignUpInfo({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          strings.sign_up_title,
          style: theme.typography.h.h3.copyWith(
            color: theme.colors.text.primary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.small),

        Text(
          strings.sign_up_description,
          textAlign: TextAlign.center,
          style: theme.typography.body.copyWith(
            color: theme.colors.text.secondary,
          ),
        ),

        Wrap(
          alignment: WrapAlignment.center,
          spacing: theme.dimensions.padding.small,
          runSpacing: theme.dimensions.padding.extraSmall,
          children: [
            Text(
              strings.sign_up_go_sign_in_label,
              style: theme.typography.body.copyWith(
                color: theme.colors.text.secondary,
              ),
            ),

            GestureDetector(
              onTap: () => onEvent(SignInClick()),
              child: Text(
                strings.auth_sign_in,
                style: theme.typography.body.copyWith(
                  color: theme.colors.text.secondary,
                  decoration: TextDecoration.underline,
                  decorationColor: theme.colors.text.secondary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
