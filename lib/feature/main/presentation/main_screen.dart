import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/main/presentation/bloc/mod.dart';
import 'package:pole/feature/main/presentation/widget/main_navigation_bar.dart';

final class MainScreen extends StatelessWidget {
  final MainBloc bloc;
  const MainScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background,
        bottomNavigationBar: MainNavigationBar(
          onTabClick: (tab) => bloc.add(TabClicked(tab: tab)),
        ),
      ),
    );
  }
}
