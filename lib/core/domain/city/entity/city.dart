import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class City with _$City {
  const factory City({
    required CityId id,
    required String name,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
