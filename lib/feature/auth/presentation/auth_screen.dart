import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';

final class AuthScreen extends StatelessWidget {
  final AuthBloc bloc;
  final StatefulNavigationShell navigationShell;

  const AuthScreen({
    super.key,
    required this.bloc,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => bloc,
    child: navigationShell,
  );
}
