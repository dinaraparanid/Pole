import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/observer/app_navigator_observer.dart';

final class AuthNavigatorObserver extends AppNavigatorObserver {
  @override
  AppRouteData get redirectRoute => findPreviousRoute((data) =>
    data.name == AppRoute.signIn.name ||
    data.name == AppRoute.signUp.name
  ) ?? AppRouteData(name: AppRoute.signIn.name, extra: null);
}
