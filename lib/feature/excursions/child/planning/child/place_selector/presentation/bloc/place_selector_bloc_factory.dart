import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/domain/visit_place/repository/place_repository.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_cubit_factory.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/load_categories_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';

final class PlaceSelectorBlocFactory {
  final VisitDurationCubitFactory _visitDurationCubitFactory;
  final SelectCategoryUseCase _selectCategoryUseCase;
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final ListenExcursionConfigChangesUseCase _excursionConfigChangesUseCase;
  final PlaceRepository _placeRepository;

  PlaceSelectorBlocFactory({
    required VisitDurationCubitFactory visitDurationCubitFactory,
    required SelectCategoryUseCase selectCategoryUseCase,
    required LoadCategoriesUseCase loadCategoriesUseCase,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required PlaceRepository placeRepository,
  }) : _selectCategoryUseCase = selectCategoryUseCase,
    _loadCategoriesUseCase = loadCategoriesUseCase,
    _excursionConfigChangesUseCase = excursionConfigChangesUseCase,
    _visitDurationCubitFactory = visitDurationCubitFactory,
    _placeRepository = placeRepository;

  PlaceSelectorBloc create({
    required DateTime startTime,
    required Duration maxDuration,
    required UiState<IList<PlaceCategory>> availableCategories,
    required void Function(Visitation) onResult,
  }) => PlaceSelectorBloc(
    visitDurationCubitFactory: _visitDurationCubitFactory,
    selectCategoryUseCase: _selectCategoryUseCase,
    loadCategoriesUseCase: _loadCategoriesUseCase,
    excursionConfigChangesUseCase: _excursionConfigChangesUseCase,
    placeRepository: _placeRepository,
    startTime: startTime,
    maxDuration: maxDuration,
    availableCategories: availableCategories,
    onResult: onResult,
  );
}
