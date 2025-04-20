import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/city/data_source/city_api.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/city/repository/city_repository.dart';

final class CityRepositoryImpl extends CityRepository {
  final CityApi _api;

  CityRepositoryImpl({required CityApi api}) : _api = api;

  @override
  Future<Either<Exception, IList<City>>> loadCities() => _api.loadCities();
}
