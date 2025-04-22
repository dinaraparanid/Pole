import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/account/domain/listen_profile_changes_use_case.dart';
import 'package:pole/core/domain/account/entity/mod.dart';
import 'package:pole/core/domain/auth/use_case/log_out_use_case.dart';
import 'package:pole/feature/profile/presentation/bloc/profile_event.dart';
import 'package:pole/feature/profile/presentation/bloc/profile_state.dart';

final class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  StreamSubscription<Profile?>? _profileChangesListener;

  ProfileBloc({
    required ListenProfileChangesUseCase profileChangesUseCase,
    required LogOutUseCase logOutUseCase,
  }) : super(ProfileState()) {

    on<UpdateProfile>((event, emit) =>
      emit(state.copyWith(profileState: event.profileState))
    );

    on<LogOut>((event, emit) => logOutUseCase());

    on<SelectTourFilter>((event, emit) =>
      emit(state.copyWith(filter: event.filter)),
    );

    on<Refresh>((event, emit) => profileChangesUseCase.triggerUpdate());

    profileChangesUseCase(
      update: (profileState) => add(UpdateProfile(profileState: profileState)),
    ).then((listener) => _profileChangesListener = listener);
  }

  @override
  Future<void> close() async {
    await _profileChangesListener?.cancel();
    _profileChangesListener = null;
    return super.close();
  }
}
