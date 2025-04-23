import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/profile/child/favourites/domain/load_favourite_excursions_use_case.dart';
import 'package:pole/feature/profile/child/favourites/presentation/bloc/favourites_bloc.dart';

final class FavouritesBlocFactory {
  final TextChangeUseCase _textChangeUseCase;
  final LoadFavouriteExcursionsUseCase _loadFavouriteExcursionsUseCase;

  FavouritesBlocFactory({
    required TextChangeUseCase textChangeUseCase,
    required LoadFavouriteExcursionsUseCase loadFavouriteExcursionsUseCase,
  }) : _textChangeUseCase = textChangeUseCase,
    _loadFavouriteExcursionsUseCase = loadFavouriteExcursionsUseCase;

  FavouritesBloc call() => FavouritesBloc(
    textChangeUseCase: _textChangeUseCase,
    loadFavouriteExcursionsUseCase: _loadFavouriteExcursionsUseCase,
  );
}
