import 'package:pole/feature/splash/presentation/bloc/splash_bloc.dart';

final class SplashBlocFactory {
  SplashBlocFactory();

  SplashBloc create({required void Function() onDone}) => SplashBloc(
    onDone: onDone,
  );
}
