import 'package:pole/core/domain/account/domain/listen_profile_changes_use_case.dart';
import 'package:pole/core/domain/auth/use_case/log_out_use_case.dart';
import 'package:pole/feature/profile/presentation/bloc/profile_bloc.dart';

final class ProfileBlocFactory {
  final LogOutUseCase _logOutUseCase;
  final ListenProfileChangesUseCase _profileChangesUseCase;

  ProfileBlocFactory({
    required ListenProfileChangesUseCase profileChangesUseCase,
    required LogOutUseCase logOutUseCase,
  }) : _logOutUseCase = logOutUseCase,
    _profileChangesUseCase = profileChangesUseCase;

  ProfileBloc call() => ProfileBloc(
    logOutUseCase: _logOutUseCase,
    profileChangesUseCase: _profileChangesUseCase,
  );
}
