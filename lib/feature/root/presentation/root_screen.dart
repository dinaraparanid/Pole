import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/root/presentation/bloc/mod.dart';

final class RootScreen extends StatelessWidget {
  final RootBlocFactory blocFactory;
  final Widget child;

  const RootScreen({
    super.key,
    required this.blocFactory,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    lazy: false,
    create: (_) => blocFactory.create(),
    child: child,
  );
}
