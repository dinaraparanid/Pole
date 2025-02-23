import 'package:flutter/material.dart';
import 'package:pole/app.dart';
import 'package:pole/di/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.registerAppModule();
  runApp(App());
}
