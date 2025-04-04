import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/presentation/widget/excursion_progress.dart';

final class ExcursionsScreen extends StatelessWidget {
  final ExcursionsBloc bloc;
  final StatefulNavigationShell navigationShell;

  const ExcursionsScreen({
    super.key,
    required this.bloc,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<ExcursionsBloc, ExcursionsState>(
        builder: (context, state) => Container(
          color: theme.colors.background,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: theme.dimensions.padding.large),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.dimensions.padding.large,
                  ),
                  child: ExcursionProgress(initialProgress: state.progress),
                ),

                SizedBox(height: theme.dimensions.padding.extraLarge),

                navigationShell,
              ],
            ),
          ),
        )
      ),
    );
  }
}
