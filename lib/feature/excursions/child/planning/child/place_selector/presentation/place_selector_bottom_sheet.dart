import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/adaptive_bottom_sheet.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/place_selector_screen.dart';

Future<void> showPlaceSelectorBottomSheet({
  required BuildContext context,
  required PlaceSelectorBloc bloc,
}) {
  final theme = context.appTheme;
  final strings = context.strings;

  return showAdaptiveBottomSheet(
    context: context,
    builder: (context) => BlocProvider(
      create: (_) => bloc,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            strings.planning_sheet_title,
            style: theme.typography.h.h3.copyWith(
              color: theme.colors.text.primary,
              fontWeight: FontWeight.w700,
            ),
          ),

          PlaceSelectorScreen(onEvent: bloc.add),
        ],
      ),
    ),
  );
}
