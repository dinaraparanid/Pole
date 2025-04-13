import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

part 'excursion.freezed.dart';

@freezed
abstract class Excursion with _$Excursion {
  const factory Excursion({
    required City city,
    required String excursionName,
    required IList<Visitation> visitations,
  }) = _Excursion;
}
