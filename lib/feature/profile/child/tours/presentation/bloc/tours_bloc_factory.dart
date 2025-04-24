import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/profile/child/tours/domain/load_tours_use_case.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/tours_bloc.dart';

final class ToursBlocFactory {
  final TextChangeUseCase _textChangeUseCase;
  final LoadToursUseCase _loadFavouriteExcursionsUseCase;

  ToursBlocFactory({
    required TextChangeUseCase textChangeUseCase,
    required LoadToursUseCase loadFavouriteExcursionsUseCase,
  }) : _textChangeUseCase = textChangeUseCase,
    _loadFavouriteExcursionsUseCase = loadFavouriteExcursionsUseCase;

  ToursBloc call({
    required TourProducer tourProducer,
  }) => ToursBloc(
    textChangeUseCase: _textChangeUseCase,
    loadFavouriteExcursionsUseCase: _loadFavouriteExcursionsUseCase,
    tourProducer: tourProducer,
  );
}
