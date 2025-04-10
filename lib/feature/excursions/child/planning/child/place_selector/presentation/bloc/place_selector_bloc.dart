import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_event.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_state.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';

final class PlaceSelectorBloc extends Bloc<PlaceSelectorEvent, PlaceSelectorState> {
  PlaceSelectorBloc({
    required SelectCategoryUseCase selectCategoryUseCase,
    required DateTime startTime,
    required UiState<List<PlaceCategory>> availableCategories,
  }) : super(PlaceSelectorState(
      startTime: startTime,
      availableCategories: availableCategories,
  )) {
    on<LoadCategories>((event, emit) {
      // TODO
    });

    on<SelectCategory>((event, emit) =>
      selectCategoryUseCase.execute(
        category: event.category,
        currentSelected: state.selectedCategories,
        updateSelection: (newSelected) =>
            emit(state.copyWith(selectedCategories: newSelected)),
      ),
    );

    on<SetVisitDuration>((event, emit) {
      // TODO
    });

    on<ConfirmPlace>((event, emit) {
      // TODO
    });
  }
}

List<PlaceCategory> _contentStub() => [
  PlaceCategory(id: 0, name: 'Еда'),
  PlaceCategory(id: 0, name: 'Развлечения'),
  PlaceCategory(id: 0, name: 'ТЦ'),
];
