import 'dart:async';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/domain/visit_place/paging/place_pager.dart';
import 'package:pole/core/domain/visit_place/repository/place_repository.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_effect.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_event.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_state.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/load_categories_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';

final class PlaceSelectorBloc extends Bloc<PlaceSelectorEvent, PlaceSelectorState>
  with BlocPresentationMixin<PlaceSelectorState, PlaceSelectorEffect> {

  final PlaceRepository _placeRepository;
  final VisitDurationCubitFactory _visitDurationCubitFactory;
  final void Function(Visitation) _onResult;

  late final _pager = PlacePager(
    repository: _placeRepository,
    categoryIdsFilterBuilder: () => state.selectedCategories.toList(),
    cityIdsFilterBuilder: () => [state.cityId.getOrNull!],
  );

  StreamSubscription<PagingState<int, VisitPlace>>? _pagerListener;
  StreamSubscription<void>? _cityIdListener;

  PlaceSelectorBloc({
    required VisitDurationCubitFactory visitDurationCubitFactory,
    required SelectCategoryUseCase selectCategoryUseCase,
    required LoadCategoriesUseCase loadCategoriesUseCase,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required PlaceRepository placeRepository,
    required DateTime startTime,
    required Duration maxDuration,
    required UiState<IList<PlaceCategory>> availableCategories,
    required void Function(Visitation) onResult,
  }) :  _visitDurationCubitFactory = visitDurationCubitFactory,
    _placeRepository = placeRepository,
    _onResult = onResult,
    super(PlaceSelectorState(
      startTime: startTime,
      maxDuration: maxDuration,
      availableCategories: availableCategories,
      pagingState: PagingState(),
    )) {

    on<UpdateCityId>((event, emit) =>
      emit(state.copyWith(cityId: UiState.data(value: event.cityId)))
    );

    on<LoadCategories>((event, emit) => loadCategoriesUseCase(
      update: (categoriesState) =>
        add(UpdateCategories(categoriesState: categoriesState)),
    ));

    on<UpdateCategories>((event, emit) =>
      emit(state.copyWith(availableCategories: event.categoriesState)),
    );

    on<UpdatePagingState>((event, emit) =>
      emit(state.copyWith(pagingState: event.pagingState))
    );

    on<LoadNextPage>((event, emit) => _pager.loadNextPage());

    on<Refresh>((event, emit) => _pager.refresh());

    on<SelectCategory>((event, emit) =>
      selectCategoryUseCase(
        categoryId: event.id,
        currentSelected: state.selectedCategories,
        updateSelection: (newSelected) =>
          emit(state.copyWith(selectedCategories: newSelected)),
      ),
    );

    on<SelectPlace>((event, emit) => emitPresentation(
      ShowVisitTimeDialog(cubit: _createVisitDurationCubit(
        place: event.place,
        maxDuration: state.maxDuration,
      ))
    ));

    if (availableCategories.getOrNull == null) {
      add(LoadCategories());
    }

    _pagerListener = _pager.stateStream.listen((pagingState) =>
      add(UpdatePagingState(pagingState: pagingState)),
    );

    _cityIdListener = excursionConfigChangesUseCase(
      update: (city, _, _, _) =>
        city?.id.let((id) => add(UpdateCityId(cityId: id))),
    );
  }

  @override
  Future<void> close() async {
    await _pagerListener?.cancel();
    _pagerListener = null;

    await _cityIdListener?.cancel();
    _cityIdListener = null;

    await _pager.close();

    return super.close();
  }

  VisitDurationCubit _createVisitDurationCubit({
    required VisitPlace place,
    required Duration maxDuration,
  }) => _visitDurationCubitFactory.create(
    place: place,
    maxDuration: maxDuration,
    onResult: (duration) {
      _onResult(
        Visitation(
          place: place,
          startTime: state.startTime,
          duration: duration,
        ),
      );

      emitPresentation(HideVisitTimeDialog());
    },
  );
}
