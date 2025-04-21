import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_request.freezed.dart';
part 'schedule_request.g.dart';

@freezed
abstract class ScheduleRequest with _$ScheduleRequest {
  const factory ScheduleRequest({
    @JsonKey(name: 'placeId') required int placeId,
    @JsonKey(name: 'dateFrom') required String dateFrom,
    @JsonKey(name: 'dateTo') required String dateTo,
  }) = _ScheduleRequest;

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
    _$ScheduleRequestFromJson(json);
}
