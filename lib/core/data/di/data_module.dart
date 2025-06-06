import 'package:get_it/get_it.dart';
import 'package:pole/core/data/account/di/account_module.dart';
import 'package:pole/core/data/auth/di/auth_data_module.dart';
import 'package:pole/core/data/city/di/city_module.dart';
import 'package:pole/core/data/db/di/database_module.dart';
import 'package:pole/core/data/excursion/di/excursion_module.dart';
import 'package:pole/core/data/visit_place/di/visit_place_module.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/store_cleaner.dart';

extension DataModule on GetIt {
  List<Type> registerDataModule() => [
    ...registerAuthDataModule(),
    ...registerAccountModule(),
    ...registerCityModule(),
    ...registerVisitPlaceModule(),
    ...registerExcursionModule(),
    ...registerDatabaseModule(),

    provideSingleton(() => StoreCleaner(
      accountStore: this(),
      authStore: this(),
      excursionStoreCleaner: this(),
    )),
  ];
}
