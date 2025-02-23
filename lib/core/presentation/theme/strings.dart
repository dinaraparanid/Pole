import 'package:flutter/widgets.dart';
import 'package:pole/l10n/app_localizations.dart';

extension AppStrings on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}
