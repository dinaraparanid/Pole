import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:pole/di/app_module.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/app_router.dart';

abstract class AppNavigatorObserver extends NavigatorObserver {
  final List<AppRouteData> _backStack = [];
  Object? _tmpExtra;

  abstract final AppRouteData redirectRoute;

  AppRoute get redirectPath {
    final redirect = redirectRoute;
    return AppRoute.values.firstWhere((route) => route.name == redirect.name);
  }

  Object? get extra {
    print('BIBA EXTRA ${redirectRoute.name}');
    return redirectRoute.extra;
  }

  AppRouteData? findPreviousRoute(bool Function(AppRouteData) predicate) {
    print('BIBA STACK ${_backStack.map((x) => x.name).toList()}');
    return _backStack.reversed.firstOrNullWhere(predicate);
  }

  void storeExtra(Object? extra) {
    if (extra != null) _tmpExtra = extra;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    final config = di<AppRouter>().value.routerDelegate.currentConfiguration;
    final name = config.last.route.name;

    print('BIBA PUSH $name || $_tmpExtra');

    if (name != null) {
      _backStack.add(AppRouteData(name: name, extra: _tmpExtra));
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _backStack.removeLast();
  }
}
