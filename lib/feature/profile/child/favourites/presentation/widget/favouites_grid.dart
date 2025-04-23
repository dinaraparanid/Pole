import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/excursion/excursion_grid.dart';
import 'package:pole/feature/profile/child/favourites/presentation/bloc/mod.dart';

final class FavouritesGrid extends StatelessWidget {
  final IList<Excursion> excursionList;
  const FavouritesGrid({super.key, required this.excursionList});

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) => ExcursionGrid(
        excursionList: excursionList,
        onClick: (item) => BlocProvider
          .of<FavouritesBloc>(context)
          .add(ExcursionClick(excursion: item)),
      ),
    );
}
