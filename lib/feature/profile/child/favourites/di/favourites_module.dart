import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/profile/child/favourites/domain/load_favourite_excursions_use_case.dart';
import 'package:pole/feature/profile/child/favourites/presentation/bloc/favourites_bloc_factory.dart';

extension FavouritesModule on GetIt {
  List<Type> registerFavouritesModule() => [
    provideSingleton(() => FavouritesBlocFactory(
      textChangeUseCase: this(),
      loadFavouriteExcursionsUseCase: this(),
    )),

    provideSingleton(() => LoadFavouriteExcursionsUseCase(repository: this())),
  ];
}
