import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_cubit_factory.dart';

extension VisitDurationModule on GetIt {
  List<Type> registerVisitDurationModule() => [
    provideSingleton<VisitDurationCubitFactory>(() =>
      VisitDurationCubitFactory(textChangeUseCase: this())
    ),
  ];
}
