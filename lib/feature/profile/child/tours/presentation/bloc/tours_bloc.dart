import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/profile/child/tours/domain/load_tours_use_case.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/tours_event.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/tours_state.dart';

final class ToursBloc extends Bloc<ToursEvent, ToursState> {
  ToursBloc({
    required TextChangeUseCase textChangeUseCase,
    required LoadToursUseCase loadFavouriteExcursionsUseCase,
  }) : super(ToursState()) {
    on<UpdateExcursionListState>((event, emit) =>
      emit(state.copyWith(excursionListState: event.excursionListState)),
    );

    on<UpdateSearchQuery>((event, emit) =>
      textChangeUseCase.execute(
        next: event.query,
        errorPredicate: (_) => false,
        update: (textContainer) =>
          emit(state.copyWith(searchQuery: textContainer)),
      ),
    );

    on<ExcursionClick>((event, emit) {
      // TODO
    });

    on<Refresh>((event, emit) {
      emit(state.copyWith(excursionListState:
        UiState.refreshing(value: state.excursionListState),
      ));

      loadFavouriteExcursionsUseCase(
        searchQuery: state.searchQuery.value,
        update: (excursionListState) =>
          emit(state.copyWith(excursionListState: excursionListState)),
      );
    });

    loadFavouriteExcursionsUseCase(
      searchQuery: state.searchQuery.value,
      update: (excursionListState) =>
        add(UpdateExcursionListState(excursionListState: excursionListState)),
    );
  }
}
