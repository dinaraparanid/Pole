import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/data/visit_place/entity/place_response.dart';
import 'package:pole/core/domain/excursion/entity/visitation.dart';
import 'package:pole/core/utils/ext/date_time.dart';

part 'visitation_response.freezed.dart';
part 'visitation_response.g.dart';

@freezed
abstract class VisitationResponse with _$VisitationResponse {
  const factory VisitationResponse({
    @JsonKey(name: 'place') required PlaceResponse place,
    @JsonKey(name: 'dateFrom') required String dateFrom,
    @JsonKey(name: 'dateTo') required String dateTo,
  }) = _VisitationResponse;

  factory VisitationResponse.fromJson(Map<String, dynamic> json) =>
    _$VisitationResponseFromJson(json);
}

extension Mapper on VisitationResponse {
  Visitation toVisitation({required DateTime day}) {
    final start = dateFrom.parseTime(day: day);
    final end = dateTo.parseTime(day: day);

    return Visitation(
      place: place.toVisitPlace(),
      startTime: dateFrom.parseTime(day: day),
      duration: end.difference(start),
    );
  }
}
