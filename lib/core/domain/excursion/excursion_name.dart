import 'package:freezed_annotation/freezed_annotation.dart';

part 'excursion_name.freezed.dart';
part 'excursion_name.g.dart';

@freezed
abstract class ExcursionName with _$ExcursionName {
  const factory ExcursionName({
    required String value,
  }) = _ExcursionName;

  factory ExcursionName.fromJson(Map<String, dynamic> json) =>
    _$ExcursionNameFromJson(json);
}
