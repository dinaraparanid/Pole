import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/mod.dart';

final class DateSelectionScreen extends StatelessWidget {
  final DateSelectionBloc bloc;

  const DateSelectionScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Text('TODO: DateSelection Ui'),
    );
  }
}
