import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/data/excursion/entity/excursion_request.dart';
import 'package:pole/core/data/excursion/entity/schedule_request.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

final class ExcursionApiImpl with ExcursionApi {
  static const _routeTours = '/tours';

  final Dio _dio;

  ExcursionApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, void>> createExcursion(Excursion excursion) async {
    try {
      final response = await _dio.put(
        _routeTours,
        data: ExcursionRequest(
          name: excursion.name.value,
          description: '', // TODO
          date: excursion.visitations.first.startTime.toIso8601String(),
          images: [],
          schedule: excursion.visitations.map((v) => ScheduleRequest(
            placeId: v.place.id,
            dateFrom: v.startTime.toIso8601String(),
            dateTo: v.endTime.toIso8601String(),
          )).toList(),
          categoryIds: [],
          cityIds: [],
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
}
