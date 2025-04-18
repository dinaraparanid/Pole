import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/domain/calculate_max_visit_duration_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_effect.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_event.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_state.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class PlanningBloc extends Bloc<PlanningEvent, PlanningState>
  with BlocPresentationMixin<PlanningState, PlanningEffect> {

  final PlaceSelectorBlocFactory _placeSelectorBlocFactory;

  PlanningBloc({
    required AppRouter router,
    required PlaceSelectorBlocFactory placeSelectorBlocFactory,
    required TextChangeUseCase textChangeUseCase,
    required CalculateMaxVisitDurationUseCase calculateMaxVisitDurationUseCase,
    required City city,
    required DateTime date,
  }) : _placeSelectorBlocFactory = placeSelectorBlocFactory,
    super(PlanningState(date: date)) {

    on<OnCreate>((event, emit) {
      if (state.excursionName.value.isEmpty) {
        add(ChangeExcursionName(name: event.initialName));
      }
    });

    on<ChangeExcursionName>((event, emit) {
      textChangeUseCase.execute(
        next: event.name,
        errorPredicate: (txt) => txt.isBlank,
        update: (textContainer) =>
          emit(state.copyWith(excursionName: textContainer)),
      );
    });

    on<ShowPlaceSelector>((event, emit) =>
      emitPresentation(ShowPlaceSelectorBottomSheet(
        bloc: _createPlaceSelectorBloc(
          startTime: event.startTime,
          maxDuration: calculateMaxVisitDurationUseCase(
            selectedPlaces: state.selectedPlaces,
            startTime: event.startTime,
          ),
        ),
      )),
    );

    on<SelectPlace>((event, emit) => emit(state.copyWith(
      selectedPlaces: state.selectedPlaces.add(event.visitation).sort(),
    )));

    on<RemovePlace>((event, emit) => emit(state.copyWith(
      selectedPlaces: state.selectedPlaces.remove(event.visitation),
    )));

    on<ConfirmDayPlan>((event, emit) => router.value.goNamed(
      AppRoute.overview.name,
      extra: Excursion(
        city: city,
        excursionName: state.excursionName.value,
        visitations: IList(state.produceTimetable().whereNotNull()),
      ),
    ));
  }

  PlaceSelectorBloc _createPlaceSelectorBloc({
    required DateTime startTime,
    required Duration maxDuration,
  }) => _placeSelectorBlocFactory.create(
    startTime: startTime,
    maxDuration: maxDuration,
    availableCategories: state.allCategories,
    onResult: (visitation) {
      add(SelectPlace(visitation: visitation));
      emitPresentation(HidePlaceSelectorBottomSheet());
    },
  );
}
