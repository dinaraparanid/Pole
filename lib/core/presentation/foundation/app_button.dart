import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final Color? enabledColor;
  final Color? disabledColor;
  final void Function() onClick;

  const AppButton({
    super.key,
    required this.text,
    required this.onClick,
    this.enabled = true,
    this.enabledColor,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return FilledButton(
      onPressed: enabled ? onClick : null,
      style: FilledButton.styleFrom(
        backgroundColor: enabledColor ?? theme.colors.button.primary,
        foregroundColor: theme.colors.text.primary,
        disabledBackgroundColor: disabledColor ?? theme.colors.button.disabled,
        disabledForegroundColor: theme.colors.text.disabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
        )
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: theme.dimensions.padding.small,
          horizontal: theme.dimensions.padding.large,
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text,
            style: theme.typography.h.h3,
          ),
        ),
      ),
    );
  }
}