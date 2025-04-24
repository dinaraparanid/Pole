import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';

abstract class ExcursionRepository with ExcursionApi {
  Future<Either<Exception, IList<Excursion>>> findFavouriteExcursions({required String searchQuery});

  Future<Either<Exception, IList<Excursion>>> findArchiveExcursions({required String searchQuery});
}
