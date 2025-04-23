import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

sealed class FavouritesEvent {}

final class UpdateExcursionListState extends FavouritesEvent {
  final UiState<IList<Excursion>> excursionListState;
  UpdateExcursionListState({required this.excursionListState});
}

final class UpdateSearchQuery extends FavouritesEvent {
  final String query;
  UpdateSearchQuery({required this.query});
}

final class ExcursionClick extends FavouritesEvent {
  final Excursion excursion;
  ExcursionClick({required this.excursion});
}

final class Refresh extends FavouritesEvent {}
