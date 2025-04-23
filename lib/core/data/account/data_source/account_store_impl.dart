import 'dart:convert';
import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class AccountStoreImpl with AccountStore {
  static const _keyProfile = 'profile';

  @override
  Future<Profile?> get profile async {
    final prefs = RxSharedPreferences.getInstance();
    final json = await prefs.getString(_keyProfile);
    return json?.let((s) => Profile.fromJson(jsonDecode(s)));
  }

  @override
  Stream<Profile?> get profileStream => RxSharedPreferences
    .getInstance()
    .getStringStream(_keyProfile)
    .distinct()
    .map((json) => json?.let((s) => Profile.fromJson(jsonDecode(s))));

  @override
  Future<void> storeProfile(Profile profile) => RxSharedPreferences
    .getInstance()
    .setString(_keyProfile, jsonEncode(profile.toJson()));

  @override
  Future<void> clear() => RxSharedPreferences.getInstance().remove(_keyProfile);
}
