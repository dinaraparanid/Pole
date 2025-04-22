import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/profile/presentation/bloc/tour_filter.dart';

sealed class ProfileEvent {}

final class UpdateProfile extends ProfileEvent {
  final UiState<Profile> profileState;
  UpdateProfile({required this.profileState});
}

final class LogOut extends ProfileEvent {}

final class SelectTourFilter extends ProfileEvent {
  final TourFilter filter;
  SelectTourFilter({required this.filter});
}

final class Refresh extends ProfileEvent {}
