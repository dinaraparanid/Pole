import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/data_source/excursion_api.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';

final class ExcursionRepositoryImpl extends ExcursionRepository {
  final ExcursionApi _api;

  ExcursionRepositoryImpl({required ExcursionApi api}) : _api = api;

  @override
  Future<Either<Exception, void>> createExcursion(Excursion excursion) =>
    _api.createExcursion(excursion);
}
