import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_cubit.dart';

final class ExcursionsCubitFactory {
  final CurrentExcursionStepStore _excursionStepStore;

  ExcursionsCubitFactory({
    required CurrentExcursionStepStore excursionStepStore,
  }) : _excursionStepStore = excursionStepStore;

  ExcursionsCubit call() => ExcursionsCubit(
    excursionStepStore: _excursionStepStore,
  );
}
