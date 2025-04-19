import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';

final class PlanningConfirmButton extends StatelessWidget {
  const PlanningConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) => AppButton(
        text: strings.next,
        isEnabled: state.isContinueButtonEnabled,
        onClick: () => BlocProvider
          .of<PlanningBloc>(context)
          .add(ConfirmDayPlan()),
      ),
    );
  }
}
