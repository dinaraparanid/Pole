import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/observer/app_navigator_observer.dart';

final class ProfileNavigatorObserver extends AppNavigatorObserver {
  @override
  AppRouteData get redirectRoute => findPreviousRoute((data) =>
    data.name == AppRoute.tours.name
  ) ?? AppRouteData(name: AppRoute.tours.name);
}
