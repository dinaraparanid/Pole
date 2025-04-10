import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';

final class PlaceSelectorBlocFactory {
  final SelectCategoryUseCase _selectCategoryUseCase;

  PlaceSelectorBlocFactory({
    required SelectCategoryUseCase selectCategoryUseCase,
  }) : _selectCategoryUseCase = selectCategoryUseCase;

  PlaceSelectorBloc create({
    required DateTime startTime,
    required UiState<List<PlaceCategory>> availableCategories,
  }) => PlaceSelectorBloc(
    selectCategoryUseCase: _selectCategoryUseCase,
    startTime: startTime,
    availableCategories: availableCategories,
  );
}
