import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/data/excursion/entity/excursion_request.dart';
import 'package:pole/core/data/excursion/entity/excursion_response.dart';
import 'package:pole/core/data/excursion/entity/schedule_request.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/entity/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

final class ExcursionApiImpl with ExcursionApi {
  static const _routeTours = '/tours';
  static const _routeToursFavorite = '/tours/favorite';

  final Dio _dio;

  ExcursionApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, void>> createExcursion(ExcursionInfo excursion) async {
    try {
      final response = await _dio.put(
        _routeTours,
        data: ExcursionRequest(
          name: excursion.name.value,
          description: '', // TODO
          date: excursion.visitations.first.startTime.toUtc().toIso8601String(),
          images: [],
          schedule: excursion.visitations.map((v) => ScheduleRequest(
            placeId: v.place.id,
            dateFrom: v.startTime.toUtc().toIso8601TimeFormat(),
            dateTo: v.endTime.toUtc().toIso8601TimeFormat(),
          )).toList(),
          categoryIds: [],
          cityIds: excursion.city.id.value,
        )
      );

      final data = BaseResponseBody.fromJson(response.data, (json) => null);

      if (response.statusCode != 200) {
        return Either.left(Exception(data.message));
      }

      return Either.right(null);
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }

  @override
  Future<Either<Exception, IList<Excursion>>> loadFavouriteExcursions() async {
    try {
      final response = await _dio.get(_routeToursFavorite);

      final data = BaseResponseBody<IList<ExcursionResponse>>.fromJson(
        response.data,
        (jsonList) => IList.fromJson(
          jsonList,
          (json) => ExcursionResponse.fromJson(json as Map<String, dynamic>),
        ),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(data.message));
      }

      return Either.right(
        data.response!.map((dto) => dto.toExcursion()).toIList(),
      );
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }

  @override
  Future<Either<Exception, Excursion>> loadExcursion(ExcursionId id) async {
    try {
      final response = await _dio.get('$_routeTours/${id.value}');

      final data = BaseResponseBody<ExcursionResponse>.fromJson(
        response.data,
        (json) => ExcursionResponse.fromJson(json as Map<String, dynamic>),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(data.message));
      }

      return Either.right(data.response!.toExcursion());
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }
}
