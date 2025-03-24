import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

enum Tabs {
  catalog,
  excursions,
  profile;
}

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(Tabs.excursions) Tabs selectedTab,
  }) = _MainState;
}
