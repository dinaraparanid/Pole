import 'package:pole/core/domain/base_store.dart';

mixin AuthStore implements BaseStore {
  Future<String?> get bearerToken;
  Stream<bool> get authorizedStream;
  Future<void> storeBearerToken({required String token});
}
