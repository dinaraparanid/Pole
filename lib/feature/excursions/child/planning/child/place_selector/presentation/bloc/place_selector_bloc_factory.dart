import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_cubit_factory.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

final class PlaceSelectorBlocFactory {
  final SelectCategoryUseCase _selectCategoryUseCase;
  final VisitDurationCubitFactory _visitDurationCubitFactory;

  PlaceSelectorBlocFactory({
    required SelectCategoryUseCase selectCategoryUseCase,
    required VisitDurationCubitFactory visitDurationCubitFactory,
  }) : _selectCategoryUseCase = selectCategoryUseCase,
    _visitDurationCubitFactory = visitDurationCubitFactory;

  PlaceSelectorBloc create({
    required DateTime startTime,
    required Duration maxDuration,
    required UiState<IList<PlaceCategory>> availableCategories,
    required void Function(Visitation) onResult,
  }) => PlaceSelectorBloc(
    selectCategoryUseCase: _selectCategoryUseCase,
    visitDurationCubitFactory: _visitDurationCubitFactory,
    startTime: startTime,
    maxDuration: maxDuration,
    availableCategories: availableCategories,
    onResult: onResult,
  );
}
