import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/excursion/entity/excursion_id.dart';
import 'package:pole/core/domain/excursion/entity/excursion_info.dart';

part 'excursion.freezed.dart';

@freezed
abstract class Excursion with _$Excursion {
  const factory Excursion({
    required ExcursionId id,
    required ExcursionInfo info,
  }) = _Excursion;
}
