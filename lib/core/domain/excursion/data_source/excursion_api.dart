import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';

mixin ExcursionApi {
  Future<Either<Exception, void>> createExcursion(Excursion excursion);
}
