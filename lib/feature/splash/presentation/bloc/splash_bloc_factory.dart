import 'package:pole/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_result.dart';

final class SplashBlocFactory {
  SplashBlocFactory();

  SplashBloc create({required void Function(SplashResult) onDone}) => SplashBloc(
    onDone: onDone,
  );
}
