import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/account/entity/profile_role.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required int id,
    required String name,
    required String email,
    required ProfileRole role
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
    _$ProfileFromJson(json);
}
