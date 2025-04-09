import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/foundation/adaptive_bottom_sheet.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';

Future<void> showPlaceSelectorBottomSheet({
  required BuildContext context,
  required void Function(PlanningEvent) onEvent,
}) {
  final theme = context.appTheme;
  final strings = context.strings;

  return showAdaptiveBottomSheet(
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          strings.planning_sheet_title,
          style: theme.typography.h.h3.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
