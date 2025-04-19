import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/mod.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String title,
  required String description,
}) => platformCall(
  android: _showMaterialErrorDialog,
  iOS: _showCupertinoErrorDialog,
  macOS: _showCupertinoErrorDialog,
)(
  context: context,
  title: title,
  description: description,
);

Future<void> _showCupertinoErrorDialog({
  required BuildContext context,
  required String title,
  required String description,
}) => showCupertinoDialog(
  context: context,
  barrierDismissible: true,
  builder: (context) => CupertinoTheme(
    data: CupertinoThemeData(brightness: Brightness.dark),
    child: CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.strings.ok),
        ),
      ],
    ),
  ),
);

Future<void> _showMaterialErrorDialog({
  required BuildContext context,
  required String title,
  required String description,
}) => showDialog(
  context: context,
  barrierDismissible: true,
  builder: (context) {
    final theme = context.appTheme;

    return AlertDialog(
      backgroundColor: theme.colors.background.primary,
      surfaceTintColor: Colors.transparent,
      titlePadding: EdgeInsets.symmetric(
        vertical: theme.dimensions.padding.extraMedium,
        horizontal: theme.dimensions.padding.extraMedium
      ),
      title: Text(
        title,
        style: theme.typography.h.h3.copyWith(
          color: theme.colors.text.primary,
        ),
      ),
      content: Text(
        description,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.secondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: theme.colors.primary,
          ),
          child: Text(
            context.strings.ok,
            style: theme.typography.regular.copyWith(
              color: theme.colors.primary,
            ),
          ),
        ),
      ],
    );
  },
);
