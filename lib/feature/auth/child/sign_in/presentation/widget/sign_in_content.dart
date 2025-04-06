import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pole/core/presentation/foundation/app_outline_text_field.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/widget/confirm_button.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/widget/sign_in_info.dart';

final class SignInContent extends StatelessWidget {
  final void Function(SignInEvent) onEvent;
  const SignInContent({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;
    final commonPadding = EdgeInsets.symmetric(
      horizontal: theme.dimensions.padding.extraMedium
    );

    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) => Column(
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

              SizedBox(height: theme.dimensions.padding.extraBig),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: commonPadding,
                  child: SignInInfo(onEvent: onEvent),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.extraBig),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: commonPadding,
                  child: AppOutlineTextField(
                    label: strings.auth_enter_email,
                    error: state.email.error ? '' : null,
                    onChanged: (input) => onEvent(EmailChange(email: input)),
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.medium),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: commonPadding,
                  child: AppOutlineTextField(
                    label: strings.auth_enter_password,
                    obscureText: true,
                    error: state.password.error ? strings.auth_invalid_credentials : null,
                    onChanged: (input) => onEvent(PasswordChange(password: input)),
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.extraBig),

              Padding(
                padding: commonPadding,
                child: ConfirmButton(onClick: () => onEvent(ConfirmClick())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
