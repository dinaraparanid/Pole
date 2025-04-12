import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/visit_place/entity/visit_place.dart';

part 'visitation.freezed.dart';

@freezed
abstract class Visitation with _$Visitation {
  const factory Visitation({
    required VisitPlace place,
    required DateTime startTime,
    required Duration duration,
  }) = _Visitation;
}

extension Properties on Visitation {
  DateTime get endTime => startTime.add(duration);
}
