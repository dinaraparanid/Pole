import 'package:dio/dio.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:pole/core/domain/auth/use_case/log_out_use_case.dart';

final class AuthInterceptor extends InterceptorsWrapper {
  final AuthStore _store;
  final LogOutUseCase _logOutUseCase;

  AuthInterceptor({
    required AuthStore store,
    required LogOutUseCase logOutUseCase,
  }) : _store = store, _logOutUseCase = logOutUseCase;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _store.bearerToken;

    if (token != null) {
      options.headers.addAll({ 'Authorization': 'Bearer $token' });
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 401) {
      await _logOutUseCase();
    }

    return super.onResponse(response, handler);
  }
}
