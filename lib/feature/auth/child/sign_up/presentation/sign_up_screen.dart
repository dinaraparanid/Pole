import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';

final class SignUpScreen extends StatelessWidget {
  final SignUpBloc bloc;
  const SignUpScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        backgroundColor: theme.colors.background,
        extendBody: true,
        body: Text('TODO: SignUpContent'),
      ),
    );
  }
}