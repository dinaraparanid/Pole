import 'package:get_it/get_it.dart';
import 'package:pole/core/data/city/data_source/city_api_impl.dart';
import 'package:pole/core/data/city/repository/city_repository_impl.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/city/data_source/city_api.dart';
import 'package:pole/core/domain/city/repository/city_repository.dart';

extension CityModule on GetIt {
  List<Type> registerCityModule() => [
    provideSingleton<CityApi>(() => CityApiImpl(dio: this())),
    provideSingleton<CityRepository>(() => CityRepositoryImpl(api: this())),
  ];
}
