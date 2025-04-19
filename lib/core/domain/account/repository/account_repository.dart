import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/account/entity/mod.dart';

abstract class AccountRepository {
  Future<Either<Exception, void>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Exception, void>> auth({
    required String email,
    required String password,
  });

  Future<Profile?> get profile;

  Future<Either<Exception, Profile>> loadProfile();
}
