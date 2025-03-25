import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class MainExtra {
  final MainBloc mainBloc;
  final ExcursionsBloc? excursionsBloc;

  MainExtra({
    required this.mainBloc,
    this.excursionsBloc,
  });
}
