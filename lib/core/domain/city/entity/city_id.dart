import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_id.freezed.dart';
part 'city_id.g.dart';

@freezed
abstract class CityId with _$CityId {
  const factory CityId({required int value}) = _CityId;

  factory CityId.fromJson(Map<String, dynamic> json) => _$CityIdFromJson(json);
}
