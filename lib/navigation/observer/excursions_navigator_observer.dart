import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/observer/app_navigator_observer.dart';

final class ExcursionsNavigatorObserver extends AppNavigatorObserver {
  @override
  AppRouteData get redirectRoute => findPreviousRoute((data) =>
    data.name == AppRoute.dateSelection.name ||
    data.name == AppRoute.planning.name ||
    data.name == AppRoute.overview.name ||
    data.name == AppRoute.creationFinish.name
  ) ?? AppRouteData(name: AppRoute.dateSelection.name);

  void onExitCreationFinish() => backStack.clear();
}
