import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/data/excursion/entity/schedule_request.dart';

part 'excursion_request.freezed.dart';
part 'excursion_request.g.dart';

@freezed
abstract class ExcursionRequest with _$ExcursionRequest {
  const factory ExcursionRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'images') required List<String> images,
    @JsonKey(name: 'schedule') required List<ScheduleRequest> schedule,
    @JsonKey(name: 'categoryIds') required List<int> categoryIds,
    @JsonKey(name: 'cityId') required int cityIds,
  }) = _ExcursionRequest;

  factory ExcursionRequest.fromJson(Map<String, dynamic> json) =>
    _$ExcursionRequestFromJson(json);
}
