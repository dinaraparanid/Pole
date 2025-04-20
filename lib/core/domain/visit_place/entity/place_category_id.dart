import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_category_id.freezed.dart';
part 'place_category_id.g.dart';

@freezed
abstract class PlaceCategoryId with _$PlaceCategoryId {
  const factory PlaceCategoryId({required int id}) = _PlaceCategoryId;

  factory PlaceCategoryId.fromJson(Map<String, dynamic> json) =>
    _$PlaceCategoryIdFromJson(json);
}
