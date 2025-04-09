import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';

final class PlanningConfirmButton extends StatelessWidget {
  final void Function(PlanningEvent) onEvent;

  const PlanningConfirmButton({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) => AppButton(
        enabled: state.isContinueButtonEnabled,
        onClick: () => onEvent(ConfirmDayPlan()),
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
    );
  }
}
