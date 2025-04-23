import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/profile/child/tours/domain/load_tours_use_case.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/tours_bloc_factory.dart';

extension ToursModule on GetIt {
  List<Type> registerToursModule() => [
    provideSingleton(() => ToursBlocFactory(
      textChangeUseCase: this(),
      loadFavouriteExcursionsUseCase: this(),
    )),

    provideSingleton(() => LoadToursUseCase(repository: this())),
  ];
}
