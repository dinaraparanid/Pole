import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/widget/confirm_button.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/widget/sign_up_info.dart';

final class SignUpContent extends StatelessWidget {
  final void Function(SignUpEvent) onEvent;
  const SignUpContent({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;
    final commonPadding = EdgeInsets.all(theme.dimensions.padding.extraMedium);

    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
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
                child: SignUpInfo(onEvent: onEvent),
              ),
            ),

            Padding(
              padding: commonPadding,
              child: ConfirmButton(onClick: () => onEvent(ConfirmClick())),
            ),
          ],
        ),
      ),
    );
  }
}
