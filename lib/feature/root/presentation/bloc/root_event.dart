import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';

sealed class RootEvent {}

final class NavigateToSplash extends RootEvent {}

final class NavigateToAuth extends RootEvent {
  final AuthRoute route;
  NavigateToAuth({required this.route});
}

final class NavigateToMain extends RootEvent {}
