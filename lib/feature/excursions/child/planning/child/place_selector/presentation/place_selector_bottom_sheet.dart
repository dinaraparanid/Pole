import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/adaptive_bottom_sheet.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/place_selector_screen.dart';

Future<void> showPlaceSelectorBottomSheet({
  required BuildContext context,
  required PlaceSelectorBloc bloc,
}) => showAdaptiveBottomSheet(
  context: context,
  builder: (context) => BlocProvider(
    create: (_) => bloc,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.strings.planning_sheet_title,
          style: context.appTheme.typography.h.h3.copyWith(
            color: context.appTheme.colors.text.primary,
          ),
        ),

        PlaceSelectorScreen(),
      ],
    ),
  ),
);
