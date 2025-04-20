import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/entity/city_id.dart';
import 'package:pole/core/domain/has_next_page.dart';
import 'package:pole/core/domain/visit_place/entity/place_category_id.dart';
import 'package:pole/core/domain/visit_place/entity/place_sorting_field.dart';
import 'package:pole/core/domain/visit_place/entity/visit_place.dart';

mixin PlaceApi {
  Future<Either<Exception, (IList<VisitPlace>, HasNextPage)>> loadPlacesPage({
    int? pageIndex,
    int? pageSize,
    PlaceSortingField? sortingField,
    bool? isAscending,
    IList<PlaceCategoryId>? categoryIdsFilter,
    IList<CityId>? cityIdsFilter,
  });
}
