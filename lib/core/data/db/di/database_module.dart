import 'package:get_it/get_it.dart';
import 'package:pole/core/data/db/app_database.dart';
import 'package:pole/core/data/excursion/db/excursion_dao.dart';
import 'package:pole/core/di/provide.dart';

extension DatabaseModule on GetIt {
  List<Type> registerDatabaseModule() => [
    provideSingleton(() => AppDatabase()),
    provideSingleton(() => ExcursionDao(this())),
  ];
}
