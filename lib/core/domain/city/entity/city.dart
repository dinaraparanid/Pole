import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

@freezed
abstract class City with _$City {
  const factory City({
    required int id,
    required String name,
  }) = _City;
}
