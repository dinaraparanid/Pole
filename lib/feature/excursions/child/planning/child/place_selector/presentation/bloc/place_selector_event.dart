import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

sealed class PlaceSelectorEvent {}

final class UpdateCityId extends PlaceSelectorEvent {
  final CityId cityId;
  UpdateCityId({required this.cityId});
}

final class LoadCategories extends PlaceSelectorEvent {}

final class UpdateCategories extends PlaceSelectorEvent {
  final UiState<IList<PlaceCategory>> categoriesState;
  UpdateCategories({required this.categoriesState});
}

final class UpdatePagingState extends PlaceSelectorEvent {
  final PagingState<int, VisitPlace> pagingState;
  UpdatePagingState({required this.pagingState});
}

final class LoadNextPage extends PlaceSelectorEvent {}

final class Refresh extends PlaceSelectorEvent {}

final class SelectCategory extends PlaceSelectorEvent {
  final PlaceCategoryId id;
  SelectCategory({required this.id});
}

final class SelectPlace extends PlaceSelectorEvent {
  final VisitPlace place;
  SelectPlace({required this.place});
}
