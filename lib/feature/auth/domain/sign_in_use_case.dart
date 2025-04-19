import 'package:pole/core/domain/account/repository/account_repository.dart';

final class SignInUseCase {
  final AccountRepository _accountRepository;

  SignInUseCase({required AccountRepository accountRepository}) :
    _accountRepository = accountRepository;

  Future<void> call({
    required String email,
    required String password,
    required void Function() onSuccess,
    required void Function(Exception) onFailure,
  }) => _accountRepository
    .auth(email: email, password: password)
    .then((result) => result.fold(onFailure, (_) => onSuccess()));
}
