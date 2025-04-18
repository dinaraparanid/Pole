import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_event.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class SplashBloc extends Bloc<SplashEvent, void> {
  SplashBloc({required AppRouter router}) : super(null) {
    on<OnSignUpClick>((event, emit) =>
      router.value.replaceNamed(AppRoute.signUp.name, extra: AuthRoute.signUp),
    );

    on<OnSignInClick>((event, emit) =>
      router.value.replaceNamed(AppRoute.signIn.name, extra: AuthRoute.signIn),
    );
  }
}
