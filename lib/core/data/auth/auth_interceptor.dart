import 'package:dio/dio.dart';
import 'package:pole/core/data/auth/auth_store.dart';

final class AuthInterceptor extends InterceptorsWrapper {
  final AuthStore _store;

  AuthInterceptor({required AuthStore store}) : _store = store;

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
}
