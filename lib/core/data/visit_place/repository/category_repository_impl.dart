import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/visit_place/data_source/category_api.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/domain/visit_place/repository/category_repository.dart';

final class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryApi _api;

  CategoryRepositoryImpl({required CategoryApi api}) : _api = api;

  @override
  Future<Either<Exception, IList<PlaceCategory>>> loadCategories() =>
    _api.loadCategories();
}
