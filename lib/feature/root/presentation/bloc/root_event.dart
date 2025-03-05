import 'package:pole/feature/auth/domain/start_screen.dart';

sealed class RootEvent {}

final class NavigateToSplash extends RootEvent {}

final class NavigateToAuth extends RootEvent {
  final StartScreen screen;
  NavigateToAuth({required this.screen});
}

final class NavigateToMain extends RootEvent {}
