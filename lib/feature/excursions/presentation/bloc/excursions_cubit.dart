import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';
import 'package:pole/feature/excursions/domain/entity/excursions_step.dart';

final class ExcursionsCubit extends Cubit<ExcursionsState> {
  final CurrentExcursionStepStore _excursionStepStore;

  StreamSubscription<ExcursionsStep?>? _stepListener;

  ExcursionsCubit({
    required CurrentExcursionStepStore excursionStepStore,
  }) : _excursionStepStore = excursionStepStore, super(ExcursionsState()) {
    _stepListener = excursionStepStore.currentStepStream.listen((currentStep) {
      final step = currentStep ?? ExcursionsStep.dateSelection();
      emit(state.copyWith(stepState: UiState.data(value: step)));
    });
  }

  Future<void> updateStep(ExcursionsStep step) =>
    _excursionStepStore.storeCurrentStep(step);

  @override
  Future<void> close() {
    _stepListener?.cancel();
    _stepListener = null;
    return super.close();
  }
}
