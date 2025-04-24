import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

typedef TourProducer = Future<Either<Exception, IList<Excursion>>> Function({required String searchQuery});

final class LoadToursUseCase {
  Future<void> call({
    required TourProducer tourProducer,
    required String searchQuery,
    required void Function(UiState<IList<Excursion>>) update,
  }) => tourProducer(searchQuery: searchQuery).then((res) => res.fold(
    (e) => update(UiState.error(e)),
    (list) => update(UiState.data(value: list)),
  ));
}
