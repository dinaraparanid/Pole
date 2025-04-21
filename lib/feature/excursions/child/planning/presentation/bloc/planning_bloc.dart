import 'dart:async';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/entity/excursion_name.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/utils/ext/bool.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/domain/calculate_max_visit_duration_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/load_categories_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/store_selected_places_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_effect.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_event.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_state.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class PlanningBloc extends Bloc<PlanningEvent, PlanningState>
  with BlocPresentationMixin<PlanningState, PlanningEffect> {

  final PlaceSelectorBlocFactory _placeSelectorBlocFactory;

  StreamSubscription<void>? _excursionConfigChangesListener;

  PlanningBloc({
    required AppRouter router,
    required PlaceSelectorBlocFactory placeSelectorBlocFactory,
    required TextChangeUseCase textChangeUseCase,
    required CalculateMaxVisitDurationUseCase calculateMaxVisitDurationUseCase,
    required LoadCategoriesUseCase loadCategoriesUseCase,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required StoreSelectedPlacesUseCase storeSelectedPlacesUseCase,
    required ExcursionConfigRepository excursionConfigRepository,
  }) : _placeSelectorBlocFactory = placeSelectorBlocFactory,
    super(PlanningState()) {

    on<OnCreate>((event, emit) {
      if (state.excursionName.value.isEmpty) {
        add(ChangeExcursionName(name: event.initialName));
      }
    });

    on<UpdateState>((event, emit) => emit(state.copyWith(
      dateState: event.date
        ?.let((d) => UiState.data(value: d))
        ?? state.dateState,
      excursionName: event.name?.value
        .let((v) => TextContainer(value: v, error: false))
        ?? state.excursionName,
      selectedPlaces: event.selectedPlaces ?? const IList.empty(),
    )));

    on<UpdateCategories>((event, emit) => emit(state.copyWith(
      allCategories: event.categoriesState,
    )));

    on<ChangeExcursionName>((event, emit) {
      textChangeUseCase.execute(
        next: event.name,
        errorPredicate: (txt) => txt.isBlank,
        update: (textContainer) {
          emit(state.copyWith(excursionName: textContainer));

          if (textContainer.error.not) {
            excursionConfigRepository.setExcursionName(
              ExcursionName(value: textContainer.value),
            );
          }
        }
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

    on<SelectPlace>((event, emit) async {
      final nextState = state.copyWith(
        selectedPlaces: state.selectedPlaces.add(event.visitation),
      );

      emit(nextState);
      await storeSelectedPlacesUseCase(state: nextState);
    });

    on<RemovePlace>((event, emit) async {
      final nextState = state.copyWith(
        selectedPlaces: state.selectedPlaces.remove(event.visitation),
      );

      emit(nextState);
      await storeSelectedPlacesUseCase(state: nextState);
    });

    on<ConfirmDayPlan>((event, emit) =>
      router.value.goNamed(AppRoute.overview.name),
    );

    loadCategoriesUseCase(update: (categoriesState) =>
      add(UpdateCategories(categoriesState: categoriesState)),
    );

    _excursionConfigChangesListener = excursionConfigChangesUseCase(
      update: (_, date, name, places) => add(UpdateState(
        date: date,
        name: name,
        selectedPlaces: places,
      )),
    );
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

  @override
  Future<void> close() async {
    await _excursionConfigChangesListener?.cancel();
    _excursionConfigChangesListener = null;
    return super.close();
  }
}
