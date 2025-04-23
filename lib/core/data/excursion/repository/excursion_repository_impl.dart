import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/domain/excursion/entity/excursion_id.dart';
import 'package:pole/core/domain/excursion/entity/excursion_info.dart';
import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';

final class ExcursionRepositoryImpl extends ExcursionRepository {
  final ExcursionApi _api;

  ExcursionRepositoryImpl({required ExcursionApi api}) : _api = api;

  @override
  Future<Either<Exception, void>> createExcursion(ExcursionInfo excursion) =>
    _api.createExcursion(excursion);

  @override
  Future<Either<Exception, Excursion>> loadExcursion(ExcursionId id) =>
    _api.loadExcursion(id);

  @override
  Future<Either<Exception, IList<Excursion>>> loadFavouriteExcursions() =>
    _api.loadFavouriteExcursions();
}
