import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';

mixin CategoryApi {
  Future<Either<Exception, IList<PlaceCategory>>> loadCategories();
}
