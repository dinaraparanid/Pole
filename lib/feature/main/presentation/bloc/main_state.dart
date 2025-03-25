import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

enum MainTabs {
  catalog,
  excursions,
  profile;
}

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(MainTabs.excursions) MainTabs selectedTab,
  }) = _MainState;
}
