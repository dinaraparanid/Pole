import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc_factory.dart';

extension PlaceSelectorModule on GetIt {
  List<Type> registerPlaceSelectorModule() => [
    provideSingleton<PlaceSelectorBlocFactory>(() =>
        PlaceSelectorBlocFactory(selectCategoryUseCase: this())
    ),
  ];
}
