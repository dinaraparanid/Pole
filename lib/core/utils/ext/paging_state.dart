import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

extension PagingStateExt<K, I> on PagingState<K, I> {
  ScrollPhysics get scrollPhysics => switch (status) {
    PagingStatus.noItemsFound ||
    PagingStatus.loadingFirstPage ||
    PagingStatus.firstPageError ||
    PagingStatus.subsequentPageError => NeverScrollableScrollPhysics(),

    PagingStatus.ongoing || PagingStatus.completed => BouncingScrollPhysics(),
  };
}