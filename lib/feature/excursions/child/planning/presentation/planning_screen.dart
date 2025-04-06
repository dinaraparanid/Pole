import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/excursion_name_field.dart';

final class PlanningScreen extends StatelessWidget {
  final PlanningBloc bloc;
  const PlanningScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    Widget CommonPadding({required Widget child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.large),
      child: child,
    );

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<PlanningBloc, PlanningState>(
        builder: (context, state) => Column(
          children: [
            CommonPadding(
              child: ExcursionNameField(
                initialText: state.excursionName.value
                  .takeIf((s) => s.isNotBlank)
                  ?? strings.planning_title_placeholder,
                placeholder: strings.planning_title_placeholder,
                onExcursionNameChanged: (name) =>
                  bloc.add(ChangeExcursionName(name: name)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
