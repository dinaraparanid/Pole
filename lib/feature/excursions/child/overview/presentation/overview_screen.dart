import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/excursion/excursion_places.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/foundation/error_dialog.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/stub/app_progress_indicator_stub.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/funtions/do_nothing.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/mod.dart';

final class OverviewScreen extends StatelessWidget {
  final OverviewCubitFactory cubitFactory;

  const OverviewScreen({
    super.key,
    required this.cubitFactory,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => cubitFactory.create(),
    child: BlocPresentationListener<OverviewCubit, OverviewEffect>(
      listener: (context, effect) => switch (effect) {
        ShowFailedToCreateExcursionEffect() => showErrorDialog(
          context: context,
          title: context.strings.overview_failed_to_create_excursion,
          description: context.strings.something_went_wrong_try_again_later,
        ),
      },
      child: BlocBuilder<OverviewCubit, OverviewState>(
        builder: (context, state) => switch (state.excursionState) {
          Initial<ExcursionInfo>() ||
          Loading<ExcursionInfo>() ||
          Refreshing<ExcursionInfo>() => AppProgressIndicatorStub(),

          Data<ExcursionInfo>() => Content(context: context, state: state),

          // Probably must never happen
          Error<ExcursionInfo>() => AppErrorStub(retry: doNothing),

          Success<ExcursionInfo>() => throw StateError('Invalid state: Success'),
        },
      ),
    ),
  );

  Widget Content({
    required BuildContext context,
    required OverviewState state,
  }) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.appTheme.dimensions.padding.large,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.excursion.name.value,
            style: context.appTheme.typography.h.h4.copyWith(
              color: context.appTheme.colors.text.primary,
            ),
          ),

          SizedBox(height: context.appTheme.dimensions.padding.small),

          Text(
            context.strings.overview_description,
            style: context.appTheme.typography.body.copyWith(
              color: context.appTheme.colors.text.secondary,
            ),
          ),

          SizedBox(height: context.appTheme.dimensions.padding.large),

          ExcursionPlaces(excursion: state.excursion),

          SizedBox(height: context.appTheme.dimensions.padding.large),

          AppButton(
            text: context.strings.overview_create_excursion,
            onClick: BlocProvider
              .of<OverviewCubit>(context)
              .createExcursion,
          ),

          SizedBox(height: context.appTheme.dimensions.padding.large),
        ],
      ),
    ),
  );
}
