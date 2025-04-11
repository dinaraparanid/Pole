import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/city/entity/city.dart';
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
    availableCategories: UiState.data(value: _categoriesStub()),
    pagingState: PagingState(
      pages: [_placesStub()],
      keys: [0],
      hasNextPage: false,
      isLoading: false,
    ),
  )) {
    on<LoadCategories>((event, emit) {
      // TODO
    });

    on<LoadNextPlacesPage>((event, emit) {
      // TODO
    });

    on<SelectCategory>((event, emit) =>
      selectCategoryUseCase.execute(
        categoryId: event.id,
        currentSelected: state.selectedCategories,
        updateSelection: (newSelected) =>
          emit(state.copyWith(selectedCategories: newSelected)),
      ),
    );

    on<SelectPlace>((event, emit) {
      // TODO
    });

    on<SetVisitDuration>((event, emit) {
      // TODO
    });

    on<ConfirmPlace>((event, emit) {
      // TODO
    });
  }
}

List<PlaceCategory> _categoriesStub() => [
  PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда'),
  PlaceCategory(id: PlaceCategoryId(id: 1), name: 'Развлечения'),
  PlaceCategory(id: PlaceCategoryId(id: 2), name: 'ТЦ'),
  PlaceCategory(id: PlaceCategoryId(id: 3), name: 'BIBA'),
  PlaceCategory(id: PlaceCategoryId(id: 4), name: 'BOBA'),
  PlaceCategory(id: PlaceCategoryId(id: 5), name: 'BUBA'),
  PlaceCategory(id: PlaceCategoryId(id: 6), name: 'BABA'),
];


List<VisitPlace> _placesStub() => [
  VisitPlace(
    id: 0,
    name: 'Биба 1',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 1'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 1,
    name: 'Биба 2',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 2'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 2,
    name: 'Биба 3',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 3'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 3,
    name: 'Биба 4',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 4'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 4,
    name: 'Биба 5',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 5'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 5,
    name: 'Биба 6',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 6'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 6,
    name: 'Биба 7',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 7'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 7,
    name: 'Биба 8',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 8'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 8,
    name: 'Биба 9',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 9'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 9,
    name: 'Биба 10',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 10'),
    address: 'Биба',
    visitTimeHours: 0,
    images: ['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg'],
    city: City(id: 0, name: 'Biba'),
  ),
];