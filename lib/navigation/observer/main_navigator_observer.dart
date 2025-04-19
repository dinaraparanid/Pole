import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/observer/app_navigator_observer.dart';

final class MainNavigatorObserver extends AppNavigatorObserver {
  @override
  AppRouteData get redirectRoute => findPreviousRoute((data) =>
    data.name == AppRoute.catalog.name ||
    data.name == AppRoute.excursions.name ||
    data.name == AppRoute.profile.name
  ) ?? AppRouteData(name: AppRoute.excursions.name);
}
