import 'dart:async';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/excursion/entity/excursion_name.dart';
import 'package:pole/core/domain/excursion/entity/visitation.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';

final class ListenExcursionConfigChangesUseCase {
  final ExcursionConfigRepository _excursionConfigRepository;

  ListenExcursionConfigChangesUseCase({
    required ExcursionConfigRepository excursionConfigRepository
  }) : _excursionConfigRepository = excursionConfigRepository;

  StreamSubscription<void> call({
    required void Function(City?, DateTime?, ExcursionName, IList<Visitation>) update,
  }) => _excursionConfigRepository.configChanges().listen((data) {
    final (city, date, name, selectedPlaces) = data;
    update(city, date, name, selectedPlaces);
  });
}
