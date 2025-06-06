import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_body.freezed.dart';
part 'base_response_body.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponseBody<T> with _$BaseResponseBody<T> {
  const factory BaseResponseBody({
    @JsonKey(name: 'status', required: false) required String? status,
    @JsonKey(name: 'message', required: false) required String? message,
    @JsonKey(name: 'response', required: false) T? response,
  }) = _BaseResponseBody<T>;

  factory BaseResponseBody.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseBodyFromJson(json, fromJsonT);
}
