import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/visit_place/entity/place_category_id.dart';

part 'place_category.freezed.dart';
part 'place_category.g.dart';

@freezed
abstract class PlaceCategory with _$PlaceCategory {
  const factory PlaceCategory({
    required PlaceCategoryId id,
    required String name,
  }) = _PlaceCategory;

  factory PlaceCategory.fromJson(Map<String, dynamic> json) =>
    _$PlaceCategoryFromJson(json);
}
