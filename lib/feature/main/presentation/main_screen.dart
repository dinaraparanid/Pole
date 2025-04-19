import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/main/presentation/bloc/mod.dart';
import 'package:pole/feature/main/presentation/widget/main_navigation_bar.dart';

final class MainScreen extends StatelessWidget {
  final MainCubitFactory cubitFactory;
  final Widget child;

  const MainScreen({
    super.key,
    required this.cubitFactory,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => cubitFactory.create(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => Scaffold(
          extendBody: true,
          backgroundColor: theme.colors.background.primary,
          body: SafeArea(child: child),
          bottomNavigationBar: MainNavigationBar(
            onTabClick: (tab) => BlocProvider
              .of<MainCubit>(context)
              .selectTab(tab),
          ),
        ),
      ),
    );
  }
}
