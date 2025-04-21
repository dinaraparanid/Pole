import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/stub/app_progress_indicator_stub.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/funtions/do_nothing.dart';
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
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => blocFactory(),
    child: BlocBuilder<ExcursionsCubit, ExcursionsState>(
      builder: (context, state) => switch (state.stepState) {
        Initial<ExcursionsStep>() ||
        Loading<ExcursionsStep>() ||
        Refreshing<ExcursionsStep>() => AppProgressIndicatorStub(),

        Data<ExcursionsStep>() => Content(context: context, state: state),

        // Probably must never happen
        Error<ExcursionsStep>() => AppErrorStub(retry: doNothing),

        Success<ExcursionsStep>() => throw StateError('Invalid state: Success'),
      },
    ),
  );

  Widget Content({
    required BuildContext context,
    required ExcursionsState state,
  }) => Container(
    color: context.appTheme.colors.background.primary,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: context.appTheme.dimensions.padding.large),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.appTheme.dimensions.padding.large,
          ),
          child: ExcursionProgress(initialProgress: state.progress),
        ),

        SizedBox(height: context.appTheme.dimensions.padding.extraLarge),

        Expanded(child: child),
      ],
    ),
  );
}
