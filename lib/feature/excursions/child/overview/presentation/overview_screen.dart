import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/mod.dart';

final class OverviewScreen extends StatelessWidget {
  final OverviewBloc bloc;
  const OverviewScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Text('TODO: OverviewScreen');
  }
}
