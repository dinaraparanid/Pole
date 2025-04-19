import 'package:pole/core/domain/account/entity/mod.dart';
import 'package:pole/core/domain/base_store.dart';

mixin AccountStore implements BaseStore {
  Future<Profile?> get profile;
  Stream<Profile> get profileStream;
  Future<void> storeProfile(Profile profile);
}
