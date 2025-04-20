import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/paging/has_next_page.dart';
import 'package:pole/core/domain/visit_place/data_source/place_api.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/domain/visit_place/repository/place_repository.dart';

final class PlaceRepositoryImpl extends PlaceRepository {
  final PlaceApi _api;

  PlaceRepositoryImpl({required PlaceApi api}) : _api = api;

  @override
  Future<Either<Exception, (List<VisitPlace>, HasNextPage)>> loadPlacesPage({
    int? pageIndex,
    int? pageSize,
    PlaceSortingField? sortingField,
    bool? isAscending,
    List<PlaceCategoryId>? categoryIdsFilter,
    List<CityId>? cityIdsFilter,
  }) => _api.loadPlacesPage(
    pageIndex: pageIndex,
    pageSize: pageSize,
    sortingField: sortingField,
    isAscending: isAscending,
    categoryIdsFilter: categoryIdsFilter,
    cityIdsFilter: cityIdsFilter,
  );
}
