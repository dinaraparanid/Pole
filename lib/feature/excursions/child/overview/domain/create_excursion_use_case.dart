import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';
import 'package:pole/core/domain/excursion/entity/excursion_info.dart';

final class CreateExcursionUseCase {
  final ExcursionRepository _excursionRepository;

  CreateExcursionUseCase({required ExcursionRepository excursionRepository}) :
    _excursionRepository = excursionRepository;

  Future<void> call({
    required ExcursionInfo excursion,
    required void Function() onSuccess,
    required void Function(Exception) onFailure,
  }) => _excursionRepository.createExcursion(excursion).then((res) =>
    res.fold(
      (e) => onFailure(e),
      (_) => onSuccess(),
    )
  );
}
