import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/data/city/entity/city_response.dart';
import 'package:pole/core/data/visit_place/entity/place_response.dart';
import 'package:pole/core/domain/excursion/entity/mod.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

part 'excursion_response.freezed.dart';
part 'excursion_response.g.dart';

@freezed
abstract class ExcursionResponse with _$ExcursionResponse {
  const factory ExcursionResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'images') required List<String> images,
    @JsonKey(name: 'schedule') required List<PlaceResponse> schedule,
    @JsonKey(name: 'city') required CityResponse city,
  }) = _ExcursionResponse;

  factory ExcursionResponse.fromJson(Map<String, dynamic> json) =>
    _$ExcursionResponseFromJson(json);
}

extension Mapper on ExcursionResponse {
  Excursion toExcursion() => Excursion(
    id: ExcursionId(value: id),
    info: ExcursionInfo(
      city: city.toCity(),
      name: ExcursionName(value: name),
      images: images.toIList(),
      visitations: schedule.map((dto) {
        final start = DateTime.parse(dto.dateFrom!);
        final end = DateTime.parse(dto.dateTo!);
        final duration = end.difference(start);

        return Visitation(
          place: dto.toVisitPlace(),
          startTime: start,
          duration: duration,
        );
      }).toIList(),
    ),
  );
}
