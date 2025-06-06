import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/data/city/entity/city_response.dart';
import 'package:pole/core/data/visit_place/entity/place_response.dart';
import 'package:pole/core/data/visit_place/entity/visitation_response.dart';
import 'package:pole/core/domain/excursion/entity/mod.dart';

part 'excursion_response.freezed.dart';
part 'excursion_response.g.dart';

@freezed
abstract class ExcursionResponse with _$ExcursionResponse {
  const factory ExcursionResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'images') required List<String> images,
    @JsonKey(name: 'schedule') required List<VisitationResponse> schedule,
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
      visitations: schedule.map((dto) =>
        dto.toVisitation(day: DateTime.parse(date))
      ).toIList(),
    ),
  );
}
