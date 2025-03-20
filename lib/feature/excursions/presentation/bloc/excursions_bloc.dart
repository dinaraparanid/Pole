import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/utils/ext/bool.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_event.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';

final class ExcursionsBloc extends Bloc<ExcursionsEvent, ExcursionsState> {
  ExcursionsBloc() : super(ExcursionsState()) {
    on<UpdateStep>((event, emit) => emit(state.copyWith(step: event.step)));
    _testAnimation();
  }

  Future<void> _testAnimation() async {
    while (isClosed.not) {
      add(UpdateStep(step: ExcursionsStep.planning));
      await Future.delayed(Duration(seconds: 1));

      if (isClosed) break;
      add(UpdateStep(step: ExcursionsStep.overview));
      await Future.delayed(Duration(seconds: 1));

      if (isClosed) break;
      add(UpdateStep(step: ExcursionsStep.planning));
      await Future.delayed(Duration(seconds: 1));

      if (isClosed) break;
      add(UpdateStep(step: ExcursionsStep.dateSelection));
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
