import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Wrap(children: [
      SizedBox(
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.medium,
        child: FittedBox(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: theme.colors.primary,
            valueColor: AlwaysStoppedAnimation(theme.colors.primary),
          ),
        ),
      )
    ]);
  }
}
