import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/text/app_outline_text_field.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/profile/child/favourites/presentation/bloc/mod.dart';
import 'package:pole/feature/profile/child/favourites/presentation/widget/favouites_grid.dart';

final class FavouritesContent extends StatelessWidget {
  final IList<Excursion> excursionList;
  const FavouritesContent({super.key, required this.excursionList});

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) => Column(
        children: [
          AppOutlineTextField(
            placeholder: context.strings.profile_search_placeholder,
            onChanged: (query) => BlocProvider
              .of<FavouritesBloc>(context)
              .add(UpdateSearchQuery(query: query)),
          ),

          SizedBox(height: context.appTheme.dimensions.padding.extraBig),

          Expanded(child: FavouritesGrid(excursionList: excursionList)),
        ],
      ),
    );
}
