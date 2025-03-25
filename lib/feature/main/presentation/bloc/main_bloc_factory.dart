import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc_factory.dart';
import 'package:pole/feature/main/domain/navigate_to_main_tab_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final ExcursionsBlocFactory _excursionsBlocFactory;
  final NavigateToMainTabUseCase _navigateToMainTabUseCase;

  MainBlocFactory({
    required ExcursionsBlocFactory excursionsBlocFactory,
    required NavigateToMainTabUseCase navigateToMainTabUseCase,
  }) : _excursionsBlocFactory = excursionsBlocFactory,
    _navigateToMainTabUseCase = navigateToMainTabUseCase;

  MainBloc create() => MainBloc(
    excursionsBlocFactory: _excursionsBlocFactory,
    navigateToMainTabUseCase: _navigateToMainTabUseCase,
  );
}
