import 'dart:convert';
import 'package:pole/core/domain/base_store.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/domain/entity/excursions_step.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class CurrentExcursionStepStore with BaseStore {
  static const _keyCurrentStep = 'current_step';

  Future<ExcursionsStep?> get currentStep async {
    final prefs = RxSharedPreferences.getInstance();
    final step = await prefs.getString(_keyCurrentStep);
    return step?.let((json) => ExcursionsStep.fromJson(jsonDecode(json)));
  }

  Stream<ExcursionsStep?> get currentStepStream => RxSharedPreferences
    .getInstance()
    .getStringStream(_keyCurrentStep)
    .map((json) => json?.let((j) => ExcursionsStep.fromJson(jsonDecode(j))))
    .distinct();

  Future<void> storeCurrentStep(ExcursionsStep step) => RxSharedPreferences
    .getInstance()
    .setString(_keyCurrentStep, jsonEncode(step.toJson()));

  @override
  Future<void> clear() => RxSharedPreferences
    .getInstance()
    .remove(_keyCurrentStep);
}
