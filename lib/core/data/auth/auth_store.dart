import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class AuthStore {
  static const _keyToken = 'token';

  Future<String?> get bearerToken {
    final prefs = RxSharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  Future<void> storeBearerToken({required String token}) async {
    final prefs = RxSharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }
}
