// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Pole';

  @override
  String get splash_title => 'Introducing Innopolis';

  @override
  String get splash_description => 'Choose a guide, places to visit and a convenient time for you.\nWe are friends with the leading guides of Innopolis.';

  @override
  String get splash_sign_up => 'Begin journey';

  @override
  String get splash_sign_in => 'Sign In';

  @override
  String get auth_sign_up => 'Sign Up';

  @override
  String get auth_sign_in => 'Sign In';

  @override
  String get auth_enter_name => 'Enter name';

  @override
  String get auth_enter_email => 'Enter email';

  @override
  String get auth_enter_password => 'Enter password';

  @override
  String get auth_confirm_password => 'Confirm password';

  @override
  String get auth_name_empty => 'The name is required to fill in';

  @override
  String get auth_email_empty => 'The email is required to fill in';

  @override
  String get auth_password_weak => 'The password must be at least 8 characters long.';

  @override
  String get auth_password_not_match => 'Passwords don\'t match';

  @override
  String get auth_invalid_credentials => 'Invalid login or password';

  @override
  String get sign_up_title => 'Registration';

  @override
  String get sign_up_description => 'Create your account and start touring now';

  @override
  String get sign_up_go_sign_in_label => 'Already have an account?';

  @override
  String get sign_in_title => 'Authorization';

  @override
  String get sign_in_description => 'To continue, log in to your account.';

  @override
  String get sign_in_go_sign_up_label => 'No account?';

  @override
  String get main_tab_catalog => 'Catalog';

  @override
  String get main_tab_excursions => 'Excursions';

  @override
  String get main_tab_profile => 'Profile';

  @override
  String get excursions_step1 => 'Date selection';

  @override
  String get excursions_step2 => 'Planning';

  @override
  String get excursions_step3 => 'Overview';
}
