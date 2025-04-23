import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppStub extends StatelessWidget {
  final String description;
  final String applyButtonText;
  final void Function()? apply;

  const AppStub({
    super.key,
    required this.description,
    required this.applyButtonText,
    this.apply,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.loadSvg('ic_stub').value,
          width: theme.dimensions.size.extraMedium,
          height: theme.dimensions.size.extraMedium,
        ),

        SizedBox(height: theme.dimensions.padding.extraMedium),

        Text(
          description,
          style: theme.typography.body.copyWith(
            color: theme.colors.text.primary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.extraMedium),

        if (apply != null) AppButton(
          text: applyButtonText,
          onClick: apply!,
          enabledColor: theme.colors.button.secondary,
        ),
      ],
    );
  }
}
