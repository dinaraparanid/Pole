import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_event.dart';

final class SplashBloc extends Bloc<SplashEvent, void> {
  final void Function() _onDone;

  SplashBloc({
    required void Function() onDone,
  }) : _onDone = onDone,
    super(null) {

    on<OnBeginJourneyClick>((event, emit) => _onDone());
  }
}
