import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/presentation/foundation/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/app_progress_indicator.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/place_selector_content.dart';

final class PlaceSelectorScreen extends StatelessWidget {
  final void Function(PlaceSelectorEvent) onEvent;
  const PlaceSelectorScreen({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<PlaceSelectorBloc, PlaceSelectorState>(
      builder: (context, state) => switch (state.availableCategories) {
        Initial<List<PlaceCategory>>() ||
        Loading<List<PlaceCategory>>() ||
        Refreshing<List<PlaceCategory>>() => Expanded(
          child: AppProgressIndicator(),
        ),

        Data<List<PlaceCategory>>(value: []) || Error<List<PlaceCategory>>() =>
            AppErrorStub(retry: () => onEvent(LoadCategories())),

        Data<List<PlaceCategory>>(value: final categories) =>
          PlaceSelectorContent(availableCategories: categories),

        Success<List<PlaceCategory>>() =>
          throw StateError('Invalid state: Success'),
      },
    );
}
