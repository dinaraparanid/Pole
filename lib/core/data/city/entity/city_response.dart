import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/mod.dart';

part 'city_response.freezed.dart';
part 'city_response.g.dart';

@freezed
abstract class CityResponse with _$CityResponse {
  const factory CityResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _CityResponse;

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
    _$CityResponseFromJson(json);
}

extension Mapper on CityResponse {
  City toCity() => City(id: CityId(value: id), name: name);
}
