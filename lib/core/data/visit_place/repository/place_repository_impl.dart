import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/has_next_page.dart';
import 'package:pole/core/domain/visit_place/data_source/place_api.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/domain/visit_place/repository/place_repository.dart';

final class PlaceRepositoryImpl extends PlaceRepository {
  final PlaceApi _api;

  PlaceRepositoryImpl({required PlaceApi api}) : _api = api;

  @override
  Future<Either<Exception, (IList<VisitPlace>, HasNextPage)>> loadPlacesPage({
    int? pageIndex,
    int? pageSize,
    PlaceSortingField? sortingField,
    bool? isAscending,
    IList<PlaceCategoryId>? categoryIdsFilter,
    IList<CityId>? cityIdsFilter,
  }) => _api.loadPlacesPage(
    pageIndex: pageIndex,
    pageSize: pageSize,
    sortingField: sortingField,
    isAscending: isAscending,
    categoryIdsFilter: categoryIdsFilter,
    cityIdsFilter: cityIdsFilter,
  );
}
