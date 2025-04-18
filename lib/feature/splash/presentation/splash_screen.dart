import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/splash/presentation/bloc/mod.dart';
import 'package:pole/feature/splash/presentation/widget/splash_content.dart';

final class SplashScreen extends StatelessWidget {
  final SplashBlocFactory blocFactory;
  const SplashScreen({super.key, required this.blocFactory});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => blocFactory.create(),
      child: Scaffold(
        backgroundColor: theme.colors.background.primary,
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

            SafeArea(child: SplashContent()),
          ],
        ),
      ),
    );
  }
}
