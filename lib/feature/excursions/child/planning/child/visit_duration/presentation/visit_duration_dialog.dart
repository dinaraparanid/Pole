import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_cubit.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/widget/visit_duration_content.dart';

void showVisitTimeDialog({
  required BuildContext context,
  required VisitDurationCubit cubit,
}) {
  final theme = context.appTheme;
  final strings = context.strings;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      backgroundColor: theme.colors.background.primary,
      surfaceTintColor: Colors.transparent,
      title: Text(
        strings.planning_dialog_title,
        textAlign: TextAlign.center,
        style: theme.typography.h.h4.copyWith(
          color: theme.colors.text.primary,
        ),
      ),
      titlePadding: EdgeInsets.symmetric(
        vertical: theme.dimensions.padding.medium,
        horizontal: theme.dimensions.padding.extraMedium
      ),
      content: BlocProvider(
        create: (_) => cubit,
        child: VisitDurationContent(),
      ),
    ),
  );
}
