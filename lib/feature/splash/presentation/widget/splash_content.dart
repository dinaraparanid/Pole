import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/splash/presentation/widget/splash_node.dart';

final class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final commonPadding = EdgeInsets.all(theme.dimensions.padding.extraMedium);

    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: commonPadding,
              child: SvgPicture.asset(
                AppImages.loadSvg('app_label').value,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: commonPadding,
              child: SplashNode(),
            ),
          ),
        ],
      ),
    );
  }
}
