import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _optionConnectTimeout = Duration(seconds: 10);
const _optionReceiveTimeout = Duration(seconds: 10);
const _optionSendTimeout = Duration(seconds: 10);
const _optionHost = 'https://pole.smashup.ru';

Dio BaseDio() => Dio(
  BaseOptions(
    baseUrl: _optionHost,
    connectTimeout: _optionConnectTimeout,
    receiveTimeout: _optionReceiveTimeout,
    sendTimeout: _optionSendTimeout,
    contentType: Headers.jsonContentType,
  )
)..interceptors.add(PrettyDioLogger());
