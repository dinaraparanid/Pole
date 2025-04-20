import 'dart:async';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';

final class ListenExcursionConfigChangesUseCase {
  final ExcursionConfigRepository _excursionConfigRepository;

  ListenExcursionConfigChangesUseCase({
    required ExcursionConfigRepository excursionConfigRepository
  }) : _excursionConfigRepository = excursionConfigRepository;

  StreamSubscription<void> call({
    required void Function(City, DateTime) update,
  }) => _excursionConfigRepository.configChanges().listen((data) {
    final (city, date) = data;
    update(city, date);
  });
}
