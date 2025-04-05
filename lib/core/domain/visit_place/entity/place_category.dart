import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_category.freezed.dart';

@freezed
abstract class PlaceCategory with _$PlaceCategory {
  const factory PlaceCategory({
    required int id,
    required String name,
  }) = _PlaceCategory;
}
