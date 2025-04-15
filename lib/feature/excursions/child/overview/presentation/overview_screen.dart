import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/excursion/excursion_places.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/overview/presentation/widget/create_excursion_button.dart';

final class OverviewScreen extends StatelessWidget {
  final OverviewBloc bloc;
  const OverviewScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<OverviewBloc, OverviewState>(
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.dimensions.padding.large,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.excursion.excursionName,
                  style: theme.typography.h.h4.copyWith(
                    color: theme.colors.text.primary,
                  ),
                ),

                SizedBox(height: theme.dimensions.padding.small),

                Text(
                  strings.overview_description,
                  style: theme.typography.body.copyWith(
                    color: theme.colors.text.secondary,
                  ),
                ),

                SizedBox(height: theme.dimensions.padding.large),

                ExcursionPlaces(excursion: state.excursion),

                SizedBox(height: theme.dimensions.padding.large),

                CreateExcursionButton(onClick: () => bloc.add(CreateExcursion())),

                SizedBox(height: theme.dimensions.padding.large),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
