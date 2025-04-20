import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/entity/city.dart';

mixin CityApi {
  Future<Either<Exception, IList<City>>> loadCities();
}
