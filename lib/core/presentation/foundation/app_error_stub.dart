import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppErrorStub extends StatelessWidget {
  final void Function() retry;
  const AppErrorStub({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

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
          strings.failed_to_load,
          style: theme.typography.body.copyWith(
            color: theme.colors.text.primary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.extraMedium),

        AppButton(
          onClick: retry,
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
                strings.try_again,
                style: theme.typography.h.h3.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
