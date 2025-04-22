import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/profile/presentation/bloc/tour_filter.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(UiState.initial()) UiState<Profile> profileState,
    @Default(TourFilter.favourites) TourFilter filter,
  }) = _ProfileState;
}
