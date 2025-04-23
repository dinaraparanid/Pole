import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
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
          child: platformCall(
            android: MaterialIndicator,
            iOS: CupertinoIndicator,
            macOS: CupertinoIndicator,
          )(context: context),
        ),
      )
    ]);
  }

  Widget CupertinoIndicator({required BuildContext context}) =>
    CupertinoActivityIndicator(color: context.appTheme.colors.primary);

  Widget MaterialIndicator({required BuildContext context}) =>
    CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation(context.appTheme.colors.primary),
    );
}
