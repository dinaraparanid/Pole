import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';

part 'visit_place.freezed.dart';

@freezed
abstract class VisitPlace with _$VisitPlace {
  const factory VisitPlace({
    required int id,
    required String name,
    required PlaceCategory category,
    required String address,
    required int visitTimeHours,
    required List<String> images,
    required City city,
  }) = _VisitPlace;
}
