import 'package:get_it/get_it.dart';
import 'package:pole/core/di/core_module.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/auth/di/auth_module.dart';
import 'package:pole/feature/excursions/di/excursions_module.dart';
import 'package:pole/feature/main/di/main_module.dart';
import 'package:pole/feature/root/di/root_module.dart';
import 'package:pole/feature/splash/di/splash_module.dart';
import 'package:pole/navigation/app_router.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  List<Type> registerAppModule() => [
    ...registerRootModule(),
    ...registerSplashModule(),
    ...registerAuthModule(),
    ...registerMainModule(),
    ...registerExcursionsModule(),
    ...registerCoreModule(),
    provideSingleton<AppRouter>(() => AppRouter()),
  ];
}
