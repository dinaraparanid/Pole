import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/account/entity/mod.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'role') required int role,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
    _$ProfileResponseFromJson(json);
}

extension Mapper on ProfileResponse {
  Profile toProfile() => Profile(
    id: id,
    name: name,
    email: email,
    role: ProfileRole.values[role],
  );
}
