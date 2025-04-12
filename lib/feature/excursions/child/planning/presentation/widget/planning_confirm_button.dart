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
    final strings = context.strings;

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) => AppButton(
        text: strings.next,
        enabled: state.isContinueButtonEnabled,
        onClick: () => onEvent(ConfirmDayPlan()),
      ),
    );
  }
}
