import 'package:pole/core/domain/visit_place/entity/mod.dart';

sealed class PlaceSelectorEvent {}

final class LoadCategories extends PlaceSelectorEvent {}

final class SelectCategory extends PlaceSelectorEvent {
  final PlaceCategory category;
  SelectCategory({required this.category});
}

final class SetVisitDuration extends PlaceSelectorEvent {}

final class ConfirmPlace extends PlaceSelectorEvent {}
