import 'package:dio/dio.dart';
import 'package:pole/core/data/auth/auth_interceptor.dart';

const _optionConnectTimeout = Duration(seconds: 10);
const _optionReceiveTimeout = Duration(seconds: 10);
const _optionSendTimeout = Duration(seconds: 10);
const _optionHost = 'http://localhost:8080';

Dio BaseDio({
  required AuthInterceptor authInterceptor,
}) => Dio(
  BaseOptions(
    baseUrl: _optionHost,
    connectTimeout: _optionConnectTimeout,
    receiveTimeout: _optionReceiveTimeout,
    sendTimeout: _optionSendTimeout,
  )
)..interceptors.add(authInterceptor);