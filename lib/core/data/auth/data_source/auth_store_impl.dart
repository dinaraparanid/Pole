import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class AuthStoreImpl with AuthStore {
  static const _keyToken = 'token';

  @override
  Future<String?> get bearerToken {
    final prefs = RxSharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  @override
  Stream<bool> get authorizedStream => RxSharedPreferences
    .getInstance()
    .getStringStream(_keyToken)
    .map((s) => s != null)
    .distinct();

  @override
  Future<void> storeBearerToken({required String token}) async {
    final prefs = RxSharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  @override
  Future<void> clear() => RxSharedPreferences.getInstance().remove(_keyToken);
}
