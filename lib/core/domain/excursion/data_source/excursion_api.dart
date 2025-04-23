import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/entity/mod.dart';

mixin ExcursionApi {
  Future<Either<Exception, Excursion>> createExcursion(ExcursionInfo excursion);

  Future<Either<Exception, IList<Excursion>>> loadFavouriteExcursions();

  Future<Either<Exception, Excursion>> loadExcursion(ExcursionId id);
}
