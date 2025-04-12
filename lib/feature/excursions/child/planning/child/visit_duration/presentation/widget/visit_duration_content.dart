import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/foundation/text/app_outline_text_field.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/widget/place_item_compact.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/mod.dart';

final class VisitDurationContent extends StatelessWidget {
  const VisitDurationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<VisitDurationCubit, VisitDurationState>(
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PlaceItemCompact(place: state.place),

          SizedBox(height: theme.dimensions.padding.large),

          AppOutlineTextField(
            label: strings.planning_dialog_duration_label,
            error: switch (state.input.error) {
              InvalidInput() => strings.planning_dialog_duration_error_invalid_input,
              TooLongDuration() => strings.planning_dialog_duration_error_too_long,
              null => null,
            },
            onChanged: (txt) => context
              .read<VisitDurationCubit>()
              .updateInput(txt),
          ),

          SizedBox(height: theme.dimensions.padding.extraBig),

          AppButton(
            text: strings.confirm,
            enabled: state.isConfirmButtonEnabled,
            onClick: () => context.read<VisitDurationCubit>().confirm(),
          ),
        ],
      ),
    );
  }
}
