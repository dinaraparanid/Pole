import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/presentation/widget/excursion_progress.dart';

final class ExcursionsScreen extends StatelessWidget {
  final ExcursionsBloc bloc;
  const ExcursionsScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: Column(
        children: [
          SizedBox(height: theme.dimensions.padding.large),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.dimensions.padding.large,
            ),
            child: ExcursionProgress(),
          ),

          SizedBox(height: theme.dimensions.padding.extraLarge),

          Text('TODO: content'),
        ],
      ),
    );
  }
}
