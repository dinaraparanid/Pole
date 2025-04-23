import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/excursion/excursion_item.dart';
import 'package:pole/core/presentation/foundation/stub/app_empty_stub.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:responsive_grid/responsive_grid.dart';

const _itemWidth = 156.0;

final class ExcursionGrid extends StatelessWidget {
  final IList<Excursion> excursionList;
  final void Function(Excursion) onClick;

  const ExcursionGrid({
    super.key,
    required this.excursionList,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) => switch (excursionList.isEmpty) {
    true => Stack(
      alignment: Alignment.center,
      children: [AppEmptyStub()],
    ),

    false => ResponsiveGridList(
      desiredItemWidth: _itemWidth,
      minSpacing: context.appTheme.dimensions.padding.extraMedium,
      children: excursionList.map((item) => ExcursionItem(
        excursion: item,
        onClick: () => onClick(item),
      )).toList(),
    ),
  };
}
