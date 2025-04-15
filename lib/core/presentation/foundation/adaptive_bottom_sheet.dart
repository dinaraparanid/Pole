import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/mod.dart';

Future<void> showAdaptiveBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) => platformCall(
  android: _showMaterialBottomSheet,
  iOS: _showCupertinoBottomSheet,
  macOS: _showCupertinoBottomSheet,
)(
  context: context,
  builder: builder,
);

Future<void> _showCupertinoBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  final theme = context.appTheme;

  return showCupertinoSheet(
    context: context,
    pageBuilder: (context) => Container(
      color: theme.colors.background.primary,
      padding: EdgeInsets.symmetric(
        vertical: theme.dimensions.padding.medium,
      ),
      child: builder(context),
    ),
  );
}

Future<void> _showMaterialBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  final theme = context.appTheme;

  return showModalBottomSheet(
    context: context,
    backgroundColor: theme.colors.background.primary,
    useRootNavigator: true,
    enableDrag: true,
    showDragHandle: true,
    constraints: BoxConstraints(minWidth: double.infinity),
    builder: builder,
  );
}
