import 'package:pole/feature/main/presentation/bloc/main_state.dart';

sealed class MainEvent {}

final class TabClicked extends MainEvent {
  final MainTabs tab;
  TabClicked({required this.tab});
}

final class OnResume extends MainEvent {}
