import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/navigation/observer/auth_navigator_observer.dart';
import 'package:pole/navigation/app_router.dart';
import 'package:pole/navigation/observer/excursions_navigator_observer.dart';
import 'package:pole/navigation/observer/main_navigator_observer.dart';

extension NavigationModule on GetIt {
  List<Type> registerNavigationModule() => [
    provideSingleton(() => AuthNavigatorObserver()),
    provideSingleton(() => ExcursionsNavigatorObserver()),
    provideSingleton(() => MainNavigatorObserver()),

    provideSingleton(() => AppRouter(
      authObserver: this(),
      excursionsObserver: this(),
      mainObserver: this(),
    )),
  ];
}
