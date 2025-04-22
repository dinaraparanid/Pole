import 'package:flutter/material.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppProgressIndicator extends StatelessWidget {
  final double? size;
  const AppProgressIndicator({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final appliedSize = size ?? theme.dimensions.size.medium;

    return Wrap(children: [
      SizedBox(
        width: appliedSize,
        height: appliedSize,
        child: FittedBox(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(theme.colors.primary),
          ),
        ),
      )
    ]);
  }
}
