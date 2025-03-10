import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppButton extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Color? enabledColor;
  final Color? disabledColor;
  final void Function() onClick;

  const AppButton({
    super.key,
    required this.onClick,
    this.enabled = true,
    this.enabledColor,
    this.disabledColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return FilledButton(
      onPressed: enabled ? onClick : null,
      style: FilledButton.styleFrom(
        backgroundColor: enabledColor ?? theme.colors.button.primary,
        disabledBackgroundColor: disabledColor ?? theme.colors.button.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
        )
      ),
      child: child,
    );
  }
}