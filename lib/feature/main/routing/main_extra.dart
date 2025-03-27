import 'package:pole/feature/excursions/rooting/excursions_extra.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class MainExtra {
  final MainBloc mainBloc;
  final ExcursionsExtra? excursionsExtra;

  MainExtra({
    required this.mainBloc,
    this.excursionsExtra,
  });
}
