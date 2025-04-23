import 'package:freezed_annotation/freezed_annotation.dart';

part 'excursion_id.freezed.dart';

@freezed
abstract class ExcursionId with _$ExcursionId {
  const factory ExcursionId({required int value}) = _ExcursionId;
}
