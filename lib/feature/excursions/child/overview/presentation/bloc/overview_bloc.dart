import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_event.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_state.dart';

final class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final void Function() _onResult;

  OverviewBloc({
    required Excursion excursion,
    required void Function() onResult,
  }) : _onResult = onResult,
    super(OverviewState(excursion: excursion)) {

    on<CreateExcursion>((event, emit) {
      // TODO
    });
  }
}
