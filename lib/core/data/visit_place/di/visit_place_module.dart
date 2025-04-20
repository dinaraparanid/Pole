import 'package:get_it/get_it.dart';
import 'package:pole/core/data/visit_place/data_source/category_api_impl.dart';
import 'package:pole/core/data/visit_place/data_source/place_api_impl.dart';
import 'package:pole/core/data/visit_place/repository/category_repository_impl.dart';
import 'package:pole/core/data/visit_place/repository/place_repository_impl.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/visit_place/data_source/category_api.dart';
import 'package:pole/core/domain/visit_place/data_source/place_api.dart';
import 'package:pole/core/domain/visit_place/repository/category_repository.dart';
import 'package:pole/core/domain/visit_place/repository/place_repository.dart';

extension VisitPlaceModule on GetIt {
  List<Type> registerVisitPlaceModule() => [
    provideSingleton<CategoryApi>(() => CategoryApiImpl(dio: this())),
    provideSingleton<PlaceApi>(() => PlaceApiImpl(dio: this())),

    provideSingleton<CategoryRepository>(() => CategoryRepositoryImpl(api: this())),
    provideSingleton<PlaceRepository>(() => PlaceRepositoryImpl(api: this())),
  ];
}
