import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final void Function() onClick;

  const AppButton({
    super.key,
    required this.onClick,
    this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return FilledButton(
      onPressed: onClick,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.colors.button.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
        )
      ),
      child: child,
    );
  }
}