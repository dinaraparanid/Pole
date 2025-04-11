import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/visit_place/entity/place_category_id.dart';

part 'place_category.freezed.dart';

@freezed
abstract class PlaceCategory with _$PlaceCategory {
  const factory PlaceCategory({
    required PlaceCategoryId id,
    required String name,
  }) = _PlaceCategory;
}
