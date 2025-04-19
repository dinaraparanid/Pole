import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/error_dialog.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/widget/sign_in_content.dart';

final class SignInScreen extends StatelessWidget {
  final SignInBlocFactory blocFactory;
  const SignInScreen({super.key, required this.blocFactory});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => blocFactory.create(),
    child: BlocPresentationListener<SignInBloc, SignInEffect>(
      listener: (context, effect) => switch (effect) {
        ShowFailedToSignInDialogEffect() => showErrorDialog(
          context: context,
          title: context.strings.sign_in_failed,
          description: context.strings.something_went_wrong_try_again_later,
        ),
      },
      child: Scaffold(
        backgroundColor: context.appTheme.colors.background.primary,
        extendBody: true,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  fit: BoxFit.fitHeight,
                  height: double.infinity,
                  AppImages.loadPng('splash').value,
                ),
              ),
            ),

            SafeArea(child: SignInContent()),
          ],
        ),
      ),
    ),
  );
}