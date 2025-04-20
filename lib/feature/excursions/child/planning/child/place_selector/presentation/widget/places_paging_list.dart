import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/stub/mod.dart';
import 'package:pole/core/presentation/foundation/app_progress_indicator.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/paging_state.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/place_item.dart';

final class PlacesPagingList extends StatelessWidget {
  const PlacesPagingList({super.key});

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<PlaceSelectorBloc, PlaceSelectorState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.appTheme.dimensions.padding.extraMedium,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                context.strings.planning_sheet_catalog,
                style: context.appTheme.typography.h.h3.copyWith(
                  color: context.appTheme.colors.text.primary,
                ),
              ),
            ),

            SizedBox(height: context.appTheme.dimensions.padding.small),

            Expanded(
              child: PagedListView<int, VisitPlace>.separated(
                state: state.pagingState,
                physics: state.pagingState.scrollPhysics,
                fetchNextPage: () => BlocProvider
                  .of<PlaceSelectorBloc>(context)
                  .add(LoadNextPage()),
                padding: EdgeInsets.zero,
                builderDelegate: PagedChildBuilderDelegate(
                  firstPageProgressIndicatorBuilder: (context) =>
                    Stack(
                      alignment: Alignment.center,
                      children: [AppProgressIndicator()],
                    ),
                  firstPageErrorIndicatorBuilder: (context) =>
                    AppErrorStub(retry: () => BlocProvider
                      .of<PlaceSelectorBloc>(context)
                      .add(Refresh()),
                    ),
                  noItemsFoundIndicatorBuilder: (context) =>
                    switch (state.isAnyCategorySelected) {
                      true => AppEmptyFiltersStub(resetFilters: () =>
                        BlocProvider
                          .of<PlaceSelectorBloc>(context)
                          .add(Refresh()),
                      ),

                      false => AppEmptyStub(retry: () =>
                        BlocProvider
                          .of<PlaceSelectorBloc>(context)
                          .add(Refresh()),
                      ),
                    },
                  itemBuilder: (context, item, index) => PlaceItem(
                    key: ValueKey(item.id),
                    place: item,
                    onClick: () => BlocProvider
                      .of<PlaceSelectorBloc>(context)
                      .add(SelectPlace(place: item)),
                  ),
                ),
                separatorBuilder: (context, _) => SizedBox(
                  height: context.appTheme.dimensions.padding.small,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
