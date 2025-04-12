import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/stub/mod.dart';
import 'package:pole/core/presentation/foundation/app_progress_indicator.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/paging_state_ext.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/place_item.dart';

final class PlacesPagingList extends StatelessWidget {
  final void Function(PlaceSelectorEvent) onEvent;
  const PlacesPagingList({super.key, required this.onEvent});

  void loadNextPage() => onEvent(LoadNextPlacesPage());

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<PlaceSelectorBloc, PlaceSelectorState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.dimensions.padding.extraMedium,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                strings.planning_sheet_catalog,
                style: theme.typography.h.h3.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),
            ),

            SizedBox(height: theme.dimensions.padding.small),

            Expanded(
              child: PagedListView<int, VisitPlace>.separated(
                state: state.pagingState,
                physics: state.pagingState.scrollPhysics,
                fetchNextPage: loadNextPage,
                padding: EdgeInsets.zero,
                builderDelegate: PagedChildBuilderDelegate(
                  firstPageProgressIndicatorBuilder: (context) =>
                    Stack(
                      alignment: Alignment.center,
                      children: [AppProgressIndicator()],
                    ),
                  firstPageErrorIndicatorBuilder: (context) =>
                    AppErrorStub(retry: loadNextPage),
                  noItemsFoundIndicatorBuilder: (context) =>
                    switch (state.isAnyCategorySelected) {
                      true => AppEmptyFiltersStub(resetFilters: loadNextPage),
                      false => AppEmptyStub(retry: loadNextPage),
                    },
                  itemBuilder: (context, item, index) => PlaceItem(
                    key: ValueKey(item.id),
                    place: item,
                    onClick: () => onEvent(SelectPlace(place: item)),
                  ),
                ),
                separatorBuilder: (context, _) => SizedBox(
                  height: theme.dimensions.padding.small,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
