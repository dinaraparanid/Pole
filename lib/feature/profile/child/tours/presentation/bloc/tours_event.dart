import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

sealed class ToursEvent {}

final class UpdateExcursionListState extends ToursEvent {
  final UiState<IList<Excursion>> excursionListState;
  UpdateExcursionListState({required this.excursionListState});
}

final class UpdateSearchQuery extends ToursEvent {
  final String query;
  UpdateSearchQuery({required this.query});
}

final class ExcursionClick extends ToursEvent {
  final Excursion excursion;
  ExcursionClick({required this.excursion});
}

final class Refresh extends ToursEvent {}
