import 'package:pole/core/domain/account/repository/account_repository.dart';

final class SignUpUseCase {
  final AccountRepository _accountRepository;

  SignUpUseCase({required AccountRepository accountRepository}) :
    _accountRepository = accountRepository;

  Future<void> call({
    required String name,
    required String email,
    required String password,
    required void Function() onSuccess,
    required void Function(Exception) onFailure,
  }) => _accountRepository
    .register(name: name, email: email, password: password)
    .then((result) => result.fold(onFailure, (_) => onSuccess()));
}
