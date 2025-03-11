import 'dart:io';

T platformCall<T>({
  required T android,
  required T iOS,
  required T macOS,
}) {
  if (Platform.isAndroid) return android;
  if (Platform.isIOS) return iOS;
  if (Platform.isMacOS) return macOS;
  throw UnimplementedError('Platform not supported');
}
