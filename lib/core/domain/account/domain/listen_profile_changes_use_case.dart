import 'dart:async';
import 'package:pole/core/domain/account/entity/mod.dart';
import 'package:pole/core/domain/account/repository/account_repository.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

final class ListenProfileChangesUseCase {
  final AccountRepository _repository;

  ListenProfileChangesUseCase({required AccountRepository repository}) :
    _repository = repository;

  Future<StreamSubscription<Profile?>> call({
    required void Function(UiState<Profile>) update,
  }) async {
    update(UiState.loading());
    await _repository.loadProfile();

    return _repository.profileStream.listen((profile) =>
      update(profile != null ? UiState.data(value: profile) : UiState.error()),
    );
  }

  Future<void> triggerUpdate() => _repository.loadProfile();
}
