import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
abstract class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
    _$CategoryResponseFromJson(json);
}

extension Mapper on CategoryResponse {
  PlaceCategory toPlaceCategory() => PlaceCategory(
    id: PlaceCategoryId(id: id),
    name: name,
  );
}
