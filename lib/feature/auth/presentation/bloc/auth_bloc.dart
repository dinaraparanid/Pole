import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart' as si;
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart' as su;
import 'package:pole/feature/auth/domain/navigate_to_auth_screen_use_case.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_event.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_state.dart';
import 'package:pole/feature/auth/routing/auth_extra.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final si.SignInBlocFactory _signInBlocFactory;
  final su.SignUpBlocFactory _signUpBlocFactory;
  final NavigateToAuthScreenUseCase _navigateToAuthScreenUseCase;
  final void Function() _onDone;

  late final si.SignInBloc _signInBloc = _signInBlocFactory.create(
    onDone: (result) => switch (result) {
      si.NavigateToSignUp() => add(NavigateToSignUp()),
      si.SignedIn() => _onDone(),
    },
  );

  late final su.SignUpBloc _signUpBloc = _signUpBlocFactory.create(
    onDone: (result) => switch (result) {
      su.NavigateToSignIn() => add(NavigateToSignIn()),
      su.SignedUp() => _onDone(),
    },
  );

  AuthBloc({
    required si.SignInBlocFactory signInBlocFactory,
    required su.SignUpBlocFactory signUpBlocFactory,
    required NavigateToAuthScreenUseCase navigateToAuthScreenUseCase,
    required AuthScreen startScreen,
    required void Function() onDone,
  }) : _onDone = onDone,
    _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory,
    _navigateToAuthScreenUseCase = navigateToAuthScreenUseCase,
    super(AuthState(screen: startScreen)) {

    on<NavigateToSignIn>((event, emit) =>
      emit(state.copyWith(screen: AuthScreen.signIn)),
    );

    on<NavigateToSignUp>((event, emit) =>
      emit(state.copyWith(screen: AuthScreen.signUp)),
    );

    _listenScreenChanges();
  }

  AuthExtra redirectExtra() => switch (state.screen) {
    AuthScreen.signIn => AuthExtra(authBloc: this, signInBloc: _signInBloc),
    AuthScreen.signUp => AuthExtra(authBloc: this, signUpBloc: _signUpBloc),
  };

  void _listenScreenChanges() {
    stream.map((s) => s.screen).distinct().listen((screen) =>
      _redirectToScreen(screen: screen),
    );
  }

  void _redirectToScreen({
    required AuthScreen screen,
  }) => _navigateToAuthScreenUseCase.execute(
    screen: screen,
    authBloc: this,
    signInBlocFactory: () => _signInBloc,
    signUpBlocFactory: () => _signUpBloc,
  );
}
