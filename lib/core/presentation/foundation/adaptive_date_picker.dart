import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/general.dart';

void showAdaptiveDatePicker({
  required BuildContext context,
  DateTime? selectedDateTime,
  required void Function(DateTime) onDatePicked,
}) => platformCall(
  android: _showMaterialDatePicker,
  iOS: _showCupertinoDatePicker,
  macOS: _showCupertinoDatePicker,
)(
  context: context,
  selectedDateTime: selectedDateTime,
  onDatePicked: onDatePicked,
);

void _showMaterialDatePicker({
  required BuildContext context,
  DateTime? selectedDateTime,
  required void Function(DateTime) onDatePicked,
}) {
  final theme = context.appTheme;

  showDatePicker(
    context: context,
    initialDate: selectedDateTime,
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    builder: (context, child) => Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          headlineLarge: theme.typography.h.h2.copyWith(
            color: theme.colors.text.secondary,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: theme.typography.h.h4.copyWith(
            color: theme.colors.text.secondary,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: theme.typography.regular.copyWith(
            color: theme.colors.text.secondary,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: theme.typography.regular.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: theme.colors.primary,
          selectionColor: theme.colors.primary,
          selectionHandleColor: theme.colors.primary,
        ),
        colorScheme: ColorScheme.dark(
          primary: theme.colors.primary,
          onPrimary: theme.colors.text.primary,
          surface: theme.colors.navigationBar.background,
          onSurface: theme.colors.text.secondary,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: theme.colors.primary,
          ),
        ),
      ),
      child: child!,
    )
  ).then((date) => date?.let(onDatePicked));
}

void _showCupertinoDatePicker({
  required BuildContext context,
  DateTime? selectedDateTime,
  required void Function(DateTime) onDatePicked,
}) {
  final theme = context.appTheme;

  showCupertinoModalPopup(
    context: context,
    builder: (context) => SizedBox(
      height: theme.dimensions.size.enormous,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: theme.typography.regular.copyWith(
              color: theme.colors.text.primary,
              fontWeight: FontWeight.w700,
            )
          )
        ),
        child: CupertinoDatePicker(
          initialDateTime: selectedDateTime,
          backgroundColor: theme.colors.navigationBar.background,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: onDatePicked,
        ),
      ),
    ),
  );
}
