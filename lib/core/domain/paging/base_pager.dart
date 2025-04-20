import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:fpdart/fpdart.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/paging/paging_requests.dart';
import 'package:pole/core/domain/paging/has_next_page.dart';
import 'package:rxdart/rxdart.dart';

abstract class BasePager<T> {
  final _stateController = BehaviorSubject.seeded(PagingState<int, T>());

  Stream<PagingState<int, T>> get stateStream => _stateController.stream;

  PagingState<int, T> get currentState =>
    _stateController.lastEventOrNull!.requireDataValue;

  Future<Either<Exception, (List<T>, HasNextPage)>> requestPage({
    required int pageIndex,
  });

  Future<void> loadNextPage() async {
    final initialState = currentState;

    _stateController.add(initialState.copyWith(isLoading: true));

    try {
      final nextKey = (initialState.keys?.last ?? PagingRequests.paramDefaultPageIndex) + 1;
      final result = await requestPage(pageIndex: nextKey);

      _stateController.add(result.fold(
        (e) => initialState.copyWith(
          error: e,
          isLoading: false,
        ),

        (data) => initialState.copyWith(
          pages: [...?initialState.pages, data.$1],
          keys: [...?initialState.keys, nextKey],
          hasNextPage: data.$2.value,
          isLoading: false,
        ),
      ));
    } catch (error) {
      _stateController.add(
        initialState.copyWith(
          error: error,
          isLoading: false,
        )
      );
    }
  }

  Future<void> refresh() async {
    final initialState = currentState;

    _stateController.add(initialState.copyWith(isLoading: true));

    try {
      final nextKey = (initialState.keys?.last ?? PagingRequests.paramDefaultPageIndex);
      final result = await requestPage(pageIndex: nextKey);

      _stateController.add(result.fold(
        (e) => initialState.copyWith(
          error: e,
          isLoading: false,
        ),

        (data) => initialState.copyWith(
          pages: [...?initialState.pages?.dropLast(1), data.$1],
          keys: initialState.keys,
          hasNextPage: data.$2.value,
          isLoading: false,
        ),
      ));
    } catch (error) {
      _stateController.add(
        initialState.copyWith(
          error: error,
          isLoading: false,
        )
      );
    }
  }

  Future<void> close() => _stateController.close();
}
