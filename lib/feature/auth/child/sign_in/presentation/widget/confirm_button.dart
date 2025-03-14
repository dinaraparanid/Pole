import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart';

final class ConfirmButton extends StatelessWidget {
  final void Function() onClick;
  const ConfirmButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => AppButton(
        onClick: onClick,
        enabled: state.isConfirmButtonEnabled,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: theme.dimensions.padding.small,
            horizontal: theme.dimensions.padding.large,
          ),
          child: Text(
            strings.auth_sign_in,
            style: theme.typography.h.h3.copyWith(
              color: theme.colors.text.primary,
            ),
          ),
        ),
      ),
    );
  }
}