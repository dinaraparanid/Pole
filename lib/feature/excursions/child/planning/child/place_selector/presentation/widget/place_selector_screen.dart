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
  const PlaceSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) =>
    BlocPresentationListener<PlaceSelectorBloc, PlaceSelectorEffect>(
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
          child: switch ((state.availableCategories, state.cityId.getOrNull)) {
            (Initial<IList<PlaceCategory>>(), _) ||
            (Loading<IList<PlaceCategory>>(), _) ||
            (Refreshing<IList<PlaceCategory>>(), _) ||
            (_, null) => AppProgressIndicator(),

            (Data<IList<PlaceCategory>>(value: []), _) ||
            (Error<IList<PlaceCategory>>(), _) =>
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.appTheme.dimensions.padding.extraMedium,
                ),
                child: AppErrorStub(retry: () => BlocProvider
                  .of<PlaceSelectorBloc>(context)
                  .add(LoadCategories())
                ),
              ),

            (Data<IList<PlaceCategory>>(value: final categories), _) =>
              PlaceSelectorContent(
                availableCategories: categories,
                selectedCategories: state.selectedCategories,
              ),

            (Success<IList<PlaceCategory>>(), _) =>
              throw StateError('Invalid state: Success'),
          },
        ),
      ),
    );
}
