import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_token.freezed.dart';
part 'account_token.g.dart';

@freezed
abstract class AccountToken with _$AccountToken {
  const factory AccountToken({
    required String value,
  }) = _AccountToken;

  factory AccountToken.fromJson(Map<String, dynamic> json) =>
    _$AccountTokenFromJson(json);
}
