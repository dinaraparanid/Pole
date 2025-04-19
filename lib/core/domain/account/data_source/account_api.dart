import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/account/entity/mod.dart';

mixin AccountApi {
  Future<Either<Exception, AccountToken>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Exception, AccountToken>> auth({
    required String email,
    required String password,
  });

  Future<Either<Exception, Profile>> loadProfile();
}
