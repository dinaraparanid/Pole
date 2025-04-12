import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/app_progress_indicator.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/place_selector_content.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/visit_duration_dialog.dart';

final class PlaceSelectorScreen extends StatelessWidget {
  final void Function(PlaceSelectorEvent) onEvent;
  const PlaceSelectorScreen({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocPresentationListener<PlaceSelectorBloc, PlaceSelectorEffect>(
      listener: (context, effect) => switch (effect) {
        ShowVisitTimeDialog() => showVisitTimeDialog(
          context: context,
          cubit: effect.cubit,
        ),

        HideVisitTimeDialog() =>
          Navigator.of(context, rootNavigator: true).pop(),
      },
      child: BlocBuilder<PlaceSelectorBloc, PlaceSelectorState>(
        builder: (context, state) => Expanded(
          child: switch (state.availableCategories) {
            Initial<IList<PlaceCategory>>() ||
            Loading<IList<PlaceCategory>>() ||
            Refreshing<IList<PlaceCategory>>() =>
              AppProgressIndicator(),

            Data<IList<PlaceCategory>>(value: []) ||
            Error<IList<PlaceCategory>>() =>
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.dimensions.padding.extraMedium,
                ),
                child: AppErrorStub(retry: () => onEvent(LoadCategories())),
              ),

            Data<IList<PlaceCategory>>(value: final categories) =>
              PlaceSelectorContent(
                availableCategories: categories,
                selectedCategories: state.selectedCategories,
                onEvent: onEvent,
              ),

            Success<IList<PlaceCategory>>() =>
              throw StateError('Invalid state: Success'),
          },
        ),
      ),
    );
  }
}
