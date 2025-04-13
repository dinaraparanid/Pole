import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_bloc_factory.dart';

extension OverviewModule on GetIt {
  List<Type> registerOverviewModule() => [
    provideSingleton<OverviewBlocFactory>(() => OverviewBlocFactory()),
  ];
}
