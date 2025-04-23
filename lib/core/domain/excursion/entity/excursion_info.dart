import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/excursion/entity/excursion_name.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

part 'excursion_info.freezed.dart';

@freezed
abstract class ExcursionInfo with _$ExcursionInfo {
  const factory ExcursionInfo({
    required City city,
    required ExcursionName name,
    required IList<String> images,
    required IList<Visitation> visitations,
  }) = _ExcursionInfo;
}
