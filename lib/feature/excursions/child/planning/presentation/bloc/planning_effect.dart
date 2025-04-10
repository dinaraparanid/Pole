import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc.dart';

sealed class PlanningEffect {}

final class ShowPlaceSelectorBottomSheet extends PlanningEffect {
  final PlaceSelectorBloc bloc;
  ShowPlaceSelectorBottomSheet({required this.bloc});
}
