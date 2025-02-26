import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/root/di/root_module.dart';
import 'package:pole/navigation/app_router.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  List<Type> registerAppModule() => [
    ...registerRootModule(),
    provideSingleton<AppRouter>(() => AppRouter()),
  ];
}
