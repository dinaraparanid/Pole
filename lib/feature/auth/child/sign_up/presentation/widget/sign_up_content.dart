import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pole/core/presentation/foundation/text/app_outline_text_field.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/widget/confirm_button.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/widget/sign_up_info.dart';

final class SignUpContent extends StatelessWidget {
  const SignUpContent({super.key});

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
        child: BlocBuilder<SignUpBloc, SignUpState>(
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
                  child: SignUpInfo(),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.extraBig),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: commonPadding,
                  child: AppOutlineTextField(
                    label: strings.auth_enter_name,
                    error: state.name.error ? strings.auth_name_empty : null,
                    onChanged: (input) => BlocProvider
                      .of<SignUpBloc>(context)
                      .add(NameChange(name: input)),
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.medium),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: commonPadding,
                  child: AppOutlineTextField(
                    label: strings.auth_enter_email,
                    error: state.email.error ? strings.auth_email_empty : null,
                    onChanged: (input) => BlocProvider
                      .of<SignUpBloc>(context)
                      .add(EmailChange(email: input)),
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
                    error: state.password.error
                      ? strings.auth_password_weak
                      : null,
                    onChanged: (input) => BlocProvider
                      .of<SignUpBloc>(context)
                      .add(PasswordChange(password: input)),
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.medium),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: commonPadding,
                  child: AppOutlineTextField(
                    label: strings.auth_confirm_password,
                    obscureText: true,
                    error: state.confirmPassword.error
                      ? strings.auth_password_not_match
                      : null,
                    onChanged: (input) => BlocProvider
                      .of<SignUpBloc>(context)
                      .add(ConfirmPasswordChange(password: input)),
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.extraBig),

              Padding(
                padding: commonPadding,
                child: ConfirmButton(
                  onClick: () => BlocProvider
                    .of<SignUpBloc>(context)
                    .add(ConfirmClick()),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.large),
            ],
          ),
        ),
      ),
    );
  }
}
