import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';

final class PlanningScreen extends StatelessWidget {
  final PlanningBloc bloc;
  const PlanningScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocProvider(
      create: (_) => bloc,
      child: Text('PlanningSreen UI'),
    );
  }
}
