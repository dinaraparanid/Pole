import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/mod.dart';

final class AuthScreen extends StatelessWidget {
  final AuthBlocFactory blocFactory;
  final AuthRoute route;
  final Widget child;

  const AuthScreen({
    super.key,
    required this.blocFactory,
    required this.route,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => blocFactory.create(route: route),
    child: child,
  );
}
