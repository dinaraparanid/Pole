import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/paging/has_next_page.dart';
import 'package:pole/core/domain/visit_place/entity/place_category_id.dart';
import 'package:pole/core/domain/visit_place/entity/place_sorting_field.dart';
import 'package:pole/core/domain/visit_place/entity/visit_place.dart';

mixin PlaceApi {
  Future<Either<Exception, (List<VisitPlace>, HasNextPage)>> loadPlacesPage({
    int? pageIndex,
    int? pageSize,
    PlaceSortingField? sortingField,
    bool? isAscending,
    List<PlaceCategoryId>? categoryIdsFilter,
    List<CityId>? cityIdsFilter,
  });
}
