import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';

final class AuthScreen extends StatelessWidget {
  final AuthBloc bloc;
  const AuthScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background,
      ),
    );
  }
}
