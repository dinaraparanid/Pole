import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/presentation/widget/excursion_progress.dart';

final class ExcursionsScreen extends StatelessWidget {
  final ExcursionsCubitFactory blocFactory;
  final Widget child;

  const ExcursionsScreen({
    super.key,
    required this.blocFactory,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => blocFactory(),
      child: BlocBuilder<ExcursionsCubit, ExcursionsState>(
        builder: (context, state) => Container(
          color: theme.colors.background.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: theme.dimensions.padding.large),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.dimensions.padding.large,
                ),
                child: ExcursionProgress(initialProgress: state.progress),
              ),

              SizedBox(height: theme.dimensions.padding.extraLarge),

              Expanded(child: child),
            ],
          ),
        )
      ),
    );
  }
}
