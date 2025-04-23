import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/excursion/excursion_grid.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/mod.dart';

final class ToursGrid extends StatelessWidget {
  final IList<Excursion> excursionList;
  const ToursGrid({super.key, required this.excursionList});

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<ToursBloc, ToursState>(
      builder: (context, state) => ExcursionGrid(
        excursionList: excursionList,
        onClick: (item) => BlocProvider
          .of<ToursBloc>(context)
          .add(ExcursionClick(excursion: item)),
      ),
    );
}
