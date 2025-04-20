import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/paging/base_pager.dart';
import 'package:pole/core/domain/paging/has_next_page.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/domain/visit_place/repository/place_repository.dart';

final class PlacePager extends BasePager<VisitPlace> {
  final PlaceRepository _repository;
  final List<PlaceCategoryId> Function() _categoryIdsFilterBuilder;
  final List<CityId> Function() _cityIdsFilterBuilder;

  PlacePager({
    required PlaceRepository repository,
    required List<PlaceCategoryId> Function() categoryIdsFilterBuilder,
    required List<CityId> Function() cityIdsFilterBuilder,
  }) : _repository = repository,
    _categoryIdsFilterBuilder = categoryIdsFilterBuilder,
    _cityIdsFilterBuilder = cityIdsFilterBuilder;

  @override
  Future<Either<Exception, (List<VisitPlace>, HasNextPage)>> requestPage({
    required int pageIndex
  }) => _repository.loadPlacesPage(
    pageIndex: pageIndex,
    categoryIdsFilter: _categoryIdsFilterBuilder(),
    cityIdsFilter: _cityIdsFilterBuilder(),
  );
}
