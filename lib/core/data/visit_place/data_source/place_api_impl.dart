import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/base_paging_response_body.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/domain/paging/paging_requests.dart';
import 'package:pole/core/data/visit_place/entity/place_response.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/paging/has_next_page.dart';
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
  Future<Either<Exception, (List<VisitPlace>, HasNextPage)>> loadPlacesPage({
    int? pageIndex,
    int? pageSize,
    PlaceSortingField? sortingField,
    bool? isAscending,
    List<PlaceCategoryId>? categoryIdsFilter,
    List<CityId>? cityIdsFilter,
  }) async {
    try {
      final response = await _dio.get(
        _routePlaces, queryParameters: {
          PagingRequests.queryPageIndex: pageIndex ?? PagingRequests.paramDefaultPageIndex,
          PagingRequests.queryPageSize: pageSize ?? PagingRequests.paramDefaultPageSize,
          _querySortingAsc: isAscending ?? false,
          if (categoryIdsFilter != null && categoryIdsFilter.isNotEmpty)
            _queryCategoryIdsFilters: categoryIdsFilter.map((it) => it.value).join(','),
          if (cityIdsFilter != null && cityIdsFilter.isNotEmpty)
            _queryCityIdsFilters: cityIdsFilter.map((it) => it.value).join(','),
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

      final items = pageData.response.map((dto) => dto.toVisitPlace()).toList();
      final hasNext = HasNextPage(value: pageData.hasNext);

      return Either.right((items, hasNext));
    } on Exception catch (_) {
      return Either.left(Exception());
    }
  }
}
