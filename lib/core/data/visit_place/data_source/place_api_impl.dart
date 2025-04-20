import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/base_paging_response_body.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/data/paging_requests.dart';
import 'package:pole/core/data/visit_place/entity/place_response.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/has_next_page.dart';
import 'package:pole/core/domain/visit_place/data_source/place_api.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

final class PlaceApiImpl with PlaceApi {
  static const _routePlaces = '/places';
  static const _querySortingAsc = 'sortingAsc';
  static const _queryCategoryIdsFilters = 'categoryIdsFilters';
  static const _queryCityIdsFilters = 'cityIdsFilters';

  final Dio _dio;

  PlaceApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, (IList<VisitPlace>, HasNextPage)>> loadPlacesPage({
    int? pageIndex,
    int? pageSize,
    PlaceSortingField? sortingField,
    bool? isAscending,
    IList<PlaceCategoryId>? categoryIdsFilter,
    IList<CityId>? cityIdsFilter,
  }) async {
    try {
      final response = await _dio.get(
        _routePlaces, queryParameters: {
          PagingRequests.queryPageIndex: pageIndex ?? PagingRequests.paramDefaultPageIndex,
          PagingRequests.queryPageSize: pageSize ?? PagingRequests.paramDefaultPageSize,
          _querySortingAsc: isAscending ?? false,
          if (categoryIdsFilter != null) _queryCategoryIdsFilters: categoryIdsFilter,
          if (categoryIdsFilter != null) _queryCityIdsFilters: cityIdsFilter,
        }
      );

      final data = BaseResponseBody<BasePagingResponseBody<PlaceResponse>>.fromJson(
        response.data,
        (jsonPagingBody) => BasePagingResponseBody.fromJson(
          jsonPagingBody as Map<String, dynamic>,
          (jsonItem) => PlaceResponse.fromJson(jsonItem as Map<String, dynamic>),
        ),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(data.message));
      }

      final pageData = data.response!;

      final items = pageData.response.map((dto) => dto.toVisitPlace()).toIList();
      final hasNext = HasNextPage(value: pageData.hasNext);

      return Either.right((items, hasNext));
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }
}
