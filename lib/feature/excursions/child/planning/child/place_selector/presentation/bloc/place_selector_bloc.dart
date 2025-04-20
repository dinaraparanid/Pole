import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_effect.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_event.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_state.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

final class PlaceSelectorBloc extends Bloc<PlaceSelectorEvent, PlaceSelectorState>
  with BlocPresentationMixin<PlaceSelectorState, PlaceSelectorEffect> {

  final VisitDurationCubitFactory _visitDurationCubitFactory;
  final void Function(Visitation) _onResult;

  PlaceSelectorBloc({
    required VisitDurationCubitFactory visitDurationCubitFactory,
    required SelectCategoryUseCase selectCategoryUseCase,
    required DateTime startTime,
    required Duration maxDuration,
    required UiState<IList<PlaceCategory>> availableCategories,
    required void Function(Visitation) onResult,
  }) :  _visitDurationCubitFactory = visitDurationCubitFactory,
    _onResult = onResult,
    super(PlaceSelectorState(
      startTime: startTime,
      maxDuration: maxDuration,
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

    on<SetVisitDuration>((event, emit) {
      // TODO
    });

    on<ConfirmPlace>((event, emit) {
      // TODO
    });
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

IList<PlaceCategory> _categoriesStub() => IList([
  PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда'),
  PlaceCategory(id: PlaceCategoryId(id: 1), name: 'Развлечения'),
  PlaceCategory(id: PlaceCategoryId(id: 2), name: 'ТЦ'),
  PlaceCategory(id: PlaceCategoryId(id: 3), name: 'BIBA'),
  PlaceCategory(id: PlaceCategoryId(id: 4), name: 'BOBA'),
  PlaceCategory(id: PlaceCategoryId(id: 5), name: 'BUBA'),
  PlaceCategory(id: PlaceCategoryId(id: 6), name: 'BABA'),
]);

List<VisitPlace> _placesStub() => [
  VisitPlace(
    id: 0,
    name: 'Биба 1',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 1'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 1,
    name: 'Биба 2',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 2'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 2,
    name: 'Биба 3',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 3'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 3,
    name: 'Биба 4',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 4'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 4,
    name: 'Биба 5',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 5'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 5,
    name: 'Биба 6',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 6'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 6,
    name: 'Биба 7',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 7'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 7,
    name: 'Биба 8',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 8'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 8,
    name: 'Биба 9',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 9'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
  VisitPlace(
    id: 9,
    name: 'Биба 10',
    category: PlaceCategory(id: PlaceCategoryId(id: 0), name: 'Еда 10'),
    address: 'Биба',
    visitTimeHours: 0,
    images: IList(['https://upload.wikimedia.org/wikipedia/commons/d/d9/Bebra_Wasserturm.jpeg']),
    city: City(id: 0, name: 'Biba'),
  ),
];
