import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/data/city/entity/city_response.dart';
import 'package:pole/core/data/visit_place/entity/category_response.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

part 'place_response.freezed.dart';
part 'place_response.g.dart';

@freezed
abstract class PlaceResponse with _$PlaceResponse {
  const factory PlaceResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'approxVisitTime') required int visitTimeHours,
    @JsonKey(name: 'images') required List<String> images,
    @JsonKey(name: 'category') required CategoryResponse category,
    @JsonKey(name: 'city') required CityResponse city,
  }) = _PlaceResponse;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
    _$PlaceResponseFromJson(json);
}

extension Mapper on PlaceResponse {
  VisitPlace toVisitPlace() => VisitPlace(
    id: id,
    name: name,
    category: category.toPlaceCategory(),
    address: address,
    visitTimeHours: visitTimeHours,
    images: images.toIList(),
    city: city.toCity(),
  );
}
