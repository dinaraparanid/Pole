import 'package:get_it/get_it.dart';
import 'package:pole/core/data/account/data_source/account_api_impl.dart';
import 'package:pole/core/data/account/data_source/account_store_impl.dart';
import 'package:pole/core/data/account/repository/account_repository_impl.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/account/data_source/account_api.dart';
import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/account/repository/account_repository.dart';

extension AccountModule on GetIt {
  List<Type> registerAccountModule() => [
    provideSingleton<AccountApi>(() => AccountApiImpl(dio: this())),
    provideSingleton<AccountStore>(() => AccountStoreImpl()),
    provideSingleton<AccountRepository>(() => AccountRepositoryImpl(
      api: this(),
      store: this(),
      tokenStore: this(),
    ))
  ];
}