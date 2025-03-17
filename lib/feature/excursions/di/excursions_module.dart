import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc_factory.dart';

extension ExcursionsModule on GetIt {
  List<Type> registerExcursionsModule() => [
    provideSingleton<ExcursionsBlocFactory>(() => ExcursionsBlocFactory()),
  ];
}
