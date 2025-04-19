import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';

final class StoreCleaner {
  final AccountStore _accountStore;
  final AuthStore _authStore;

  StoreCleaner({
    required AccountStore accountStore,
    required AuthStore authStore,
  }) : _accountStore = accountStore, _authStore = authStore;

  Future<void> call() async {
    await _accountStore.clear();
    await _authStore.clear();
  }
}
