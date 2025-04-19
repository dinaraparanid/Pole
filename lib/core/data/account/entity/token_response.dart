import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/account/entity/account_token.dart';

part 'token_response.freezed.dart';
part 'token_response.g.dart';

@freezed
abstract class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: 'token') required String token,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
    _$TokenResponseFromJson(json);
}

extension Mapper on TokenResponse {
  AccountToken toAccountToken() => AccountToken(value: token);
}
