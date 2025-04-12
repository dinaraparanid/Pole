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
    final strings = context.strings;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => AppButton(
        text: strings.auth_sign_in,
        onClick: onClick,
        enabled: state.isConfirmButtonEnabled,
      ),
    );
  }
}