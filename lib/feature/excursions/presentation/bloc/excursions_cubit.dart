import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';

final class ExcursionsCubit extends Cubit<ExcursionsState> {
  ExcursionsCubit() : super(ExcursionsState());

  void updateStep(ExcursionsStep step) => emit(state.copyWith(step: step));
}
