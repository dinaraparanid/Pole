import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/data/account/entity/mod.dart';
import 'package:pole/core/data/account/entity/profile_response.dart';
import 'package:pole/core/data/base_response_body.dart';
import 'package:pole/core/domain/account/data_source/account_api.dart';
import 'package:pole/core/domain/account/entity/account_token.dart';
import 'package:pole/core/domain/account/entity/profile.dart';

final class AccountApiImpl with AccountApi {
  static const _routeRegister = '/account/register';
  static const _routeAuth = '/account/auth';
  static const _routeProfile = '/account/profile';

  final Dio _dio;

  AccountApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, AccountToken>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<BaseResponseBody<TokenResponse>>(
        _routeRegister,
        data: RegisterRequest(name: name, email: email, password: password),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(response.data?.message));
      }

      return Either.right(AccountToken(value: response.data!.response.token));
    } on Exception catch (e) {
      return Either.left(Exception());
    }
  }

  @override
  Future<Either<Exception, AccountToken>> auth({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<BaseResponseBody<TokenResponse>>(
        _routeAuth,
        data: AuthRequest(email: email, password: password),
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(response.data?.message));
      }

      return Either.right(response.data!.response.toAccountToken());
    } on Exception catch (e) {
      return Either.left(Exception());
    }
  }

  @override
  Future<Either<Exception, Profile>> loadProfile() async {
    try {
      final response = await _dio.post<BaseResponseBody<ProfileResponse>>(
        _routeProfile,
      );

      if (response.statusCode != 200) {
        return Either.left(Exception(response.data?.message));
      }

      return Either.right(response.data!.response.toProfile());
    } on Exception catch (e) {
      return Either.left(Exception());
    }
  }
}
