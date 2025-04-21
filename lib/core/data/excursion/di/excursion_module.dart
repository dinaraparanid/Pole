import 'package:get_it/get_it.dart';
import 'package:pole/core/data/excursion/data_source/excursion_api_impl.dart';
import 'package:pole/core/data/excursion/repository/excursion_repository_impl.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';

extension ExcursionModule on GetIt {
  List<Type> registerExcursionModule() => [
    provideSingleton<ExcursionApi>(() => ExcursionApiImpl(dio: this())),
    provideSingleton<ExcursionRepository>(() => ExcursionRepositoryImpl(api: this())),
  ];
}
