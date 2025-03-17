import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc_factory.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final ExcursionsBlocFactory _excursionsBlocFactory;

  MainBlocFactory({
    required ExcursionsBlocFactory excursionsBlocFactory,
  }) : _excursionsBlocFactory = excursionsBlocFactory;

  MainBloc create() => MainBloc(
    excursionsBlocFactory: _excursionsBlocFactory,
  );
}
