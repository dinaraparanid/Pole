import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/excursion_name_field.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/excursions_timetable.dart';

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

            SizedBox(height: theme.dimensions.padding.small),

            CommonPadding(
              child: Text(
                strings.planning_description,
                style: theme.typography.body.copyWith(
                  color: theme.colors.text.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: theme.dimensions.padding.large),

            CommonPadding(
              child: ExcursionsTimetable()
            ),

            SizedBox(height: theme.dimensions.padding.large),

            CommonPadding(
              child: AppButton(
                enabled: state.isContinueButtonEnabled,
                onClick: () => bloc.add(ConfirmDayPlan()),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: theme.dimensions.padding.small,
                    horizontal: theme.dimensions.padding.large,
                  ),
                  child: Text(
                    strings.next,
                    style: theme.typography.h.h3.copyWith(
                      color: theme.colors.text.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
