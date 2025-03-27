import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart';

sealed class RootEvent {}

final class NavigateToSplash extends RootEvent {}

final class NavigateToAuth extends RootEvent {
  final AuthScreen screen;
  NavigateToAuth({required this.screen});
}

final class NavigateToMain extends RootEvent {}
