import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/excursion/db/excursion_dao.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/domain/excursion/entity/excursion_id.dart';
import 'package:pole/core/domain/excursion/entity/excursion_info.dart';
import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';

final class ExcursionRepositoryImpl extends ExcursionRepository {
  final ExcursionApi _api;
  final ExcursionDao _dao;

  ExcursionRepositoryImpl({
    required ExcursionApi api,
    required ExcursionDao dao,
  }) : _api = api, _dao = dao;

  @override
  Future<Either<Exception, Excursion>> loadExcursion(ExcursionId id) =>
    _api.loadExcursion(id);

  @override
  Future<Either<Exception, IList<Excursion>>> loadFavouriteExcursions() =>
    _api.loadFavouriteExcursions();

  @override
  Future<Either<Exception, IList<Excursion>>> findFavouriteExcursions({
    required String searchQuery,
  }) async {
    final res = await _api.loadFavouriteExcursions();

    return res.map((list) => list
      .filter((it) => it.info.name.value.contains(searchQuery))
      .toIList()
    );
  }

  @override
  Future<Either<Exception, IList<Excursion>>> findArchiveExcursions({
    required String searchQuery,
  }) async {
    final list = await _dao.excursions(searchQuery: searchQuery);
    return Either.right(list);
  }

  @override
  Future<Either<Exception, Excursion>> createExcursion(ExcursionInfo excursion) =>
    _api.createExcursion(excursion).then((res) => res.map((e) {
      _dao.insertExcursion(excursion: e);
      return e;
    }).mapLeft((e) {
      print(e);
      return e;
    }));
}
