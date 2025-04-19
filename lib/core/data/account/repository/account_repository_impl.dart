import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/auth/auth_store.dart';
import 'package:pole/core/domain/account/data_source/account_api.dart';
import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/domain/account/repository/account_repository.dart';
import 'package:pole/core/utils/ext/either.dart';

final class AccountRepositoryImpl extends AccountRepository {
  final AccountApi _api;
  final AccountStore _store;
  final AuthStore _tokenStore;

  AccountRepositoryImpl({
    required AccountApi api,
    required AccountStore store,
    required AuthStore tokenStore,
  }) : _api = api, _store = store, _tokenStore = tokenStore;

  @override
  Future<Either<Exception, void>> register({
    required String name,
    required String email,
    required String password,
  }) => _api
    .register(name: name, email: email, password: password)
    .then((tokenRes) => tokenRes
      .map((token) => _tokenStore.storeBearerToken(token: token.value))
      .sequence
  );

  @override
  Future<Either<Exception, void>> auth({
    required String email,
    required String password,
  }) => _api
    .auth(email: email, password: password)
    .then((tokenRes) => tokenRes
      .map((token) => _tokenStore.storeBearerToken(token: token.value))
      .sequence
    );

  @override
  Future<Either<Exception, Profile>> loadProfile() =>
    _api.loadProfile().then((profileRes) =>
      profileRes.map((profile) {
        _store.storeProfile(profile);
        return profile;
      }),
    );

  @override
  Future<Profile?> get profile => _store.profile;
}
