import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/data/visit_place/entity/category_response.dart';
import 'package:pole/core/domain/visit_place/data_source/category_api.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';

final class CategoryApiImpl with CategoryApi {
  static const _routeCategories = '/categories';

  final Dio _dio;

  CategoryApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, IList<PlaceCategory>>> loadCategories() async {
    try {
      final response = await _dio.get(_routeCategories);

      final data = BaseResponseBody<IList<CategoryResponse>>.fromJson(
        response.data,
        (jsonList) => IList.fromJson(
          jsonList,
          (json) => CategoryResponse.fromJson(json as Map<String, dynamic>),
        ),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(data.message));
      }

      return Either.right(
        data.response!
          .map((dto) => dto.toPlaceCategory())
          .toIList(),
      );
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }
}
