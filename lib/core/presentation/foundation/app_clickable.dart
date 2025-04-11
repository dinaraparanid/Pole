import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppClickable extends StatelessWidget {
  final void Function() onClick;
  final ShapeBorder? border;
  final Color? rippleColor;
  final Widget child;

  const AppClickable({
    super.key,
    required this.onClick,
    this.border,
    this.rippleColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        customBorder: border,
        splashColor: rippleColor ?? theme.colors.button.ripple,
        child: Ink(
          child: IgnorePointer(
            child: Padding(
              padding: EdgeInsets.all(theme.dimensions.size.minimum),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
