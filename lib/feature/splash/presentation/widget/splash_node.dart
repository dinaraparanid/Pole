import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_event.dart';

final class SplashNode extends StatelessWidget {
  const SplashNode({super.key});

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
          onClick: () => BlocProvider
            .of<SplashBloc>(context)
            .add(OnSignUpClick()),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        AppButton(
          text: strings.splash_sign_in,
          enabledColor: theme.colors.button.secondary,
          onClick: () => BlocProvider
            .of<SplashBloc>(context)
            .add(OnSignInClick()),
        ),
      ],
    );
  }
}
