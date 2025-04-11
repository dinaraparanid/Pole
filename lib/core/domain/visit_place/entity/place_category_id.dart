import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_category_id.freezed.dart';

@freezed
abstract class PlaceCategoryId with _$PlaceCategoryId {
  const factory PlaceCategoryId({required int id}) = _PlaceCategoryId;
}
