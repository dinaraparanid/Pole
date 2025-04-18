import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/root/presentation/bloc/mod.dart';

final class RootScreen extends StatelessWidget {
  final RootBlocFactory blocFactory;
  const RootScreen({super.key, required this.blocFactory});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      lazy: false,
      create: (_) => blocFactory.create(),
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background.primary,
      ),
    );
  }
}
