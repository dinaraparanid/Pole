import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_event.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_result.dart';

final class SplashBloc extends Bloc<SplashEvent, void> {
  final void Function(SplashResult) _onDone;

  SplashBloc({
    required void Function(SplashResult) onDone,
  }) : _onDone = onDone,
    super(null) {
    on<OnSignUpClick>((event, emit) => _onDone(SignUp()));
    on<OnSignInClick>((event, emit) => _onDone(SignIn()));
  }
}
