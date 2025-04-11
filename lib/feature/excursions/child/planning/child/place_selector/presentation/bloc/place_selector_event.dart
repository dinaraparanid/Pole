import 'package:pole/core/domain/visit_place/entity/mod.dart';

sealed class PlaceSelectorEvent {}

final class LoadCategories extends PlaceSelectorEvent {}

final class LoadNextPlacesPage extends PlaceSelectorEvent {}

final class SelectCategory extends PlaceSelectorEvent {
  final PlaceCategoryId id;
  SelectCategory({required this.id});
}

final class SelectPlace extends PlaceSelectorEvent {
  final VisitPlace place;
  SelectPlace({required this.place});
}

final class SetVisitDuration extends PlaceSelectorEvent {}

final class ConfirmPlace extends PlaceSelectorEvent {}
