import 'package:dio/dio.dart';
import 'package:pole/core/data/auth/auth_interceptor.dart';
import 'package:pole/core/data/base_dio.dart';

Dio AuthDio({required AuthInterceptor authInterceptor}) =>
  BaseDio()..interceptors.add(authInterceptor);