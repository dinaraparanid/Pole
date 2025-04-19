import 'package:pole/core/domain/account/entity/mod.dart';

mixin AccountStore {
  Future<Profile?> get profile;
  Stream<Profile> get profileStream;
  Future<void> storeProfile(Profile profile);
}
