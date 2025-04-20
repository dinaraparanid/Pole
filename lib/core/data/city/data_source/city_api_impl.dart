import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/data/city/entity/city_response.dart';
import 'package:pole/core/domain/city/data_source/city_api.dart';
import 'package:pole/core/domain/city/entity/city.dart';

final class CityApiImpl with CityApi {
  static const _routeCities = '/cities';

  final Dio _dio;

  CityApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, IList<City>>> loadCities() async {
    try {
      final response = await _dio.get(_routeCities);

      final data = BaseResponseBody<IList<CityResponse>>.fromJson(
        response.data,
        (jsonList) => IList.fromJson(
          jsonList,
          (json) => CityResponse.fromJson(json as Map<String, dynamic>),
        ),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(data.message));
      }

      return Either.right(data.response!.map((dto) => dto.toCity()).toIList());
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }
}
