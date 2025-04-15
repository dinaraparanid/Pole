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
  String get continue_txt => 'Continue';

  @override
  String get next => 'Next';

  @override
  String get confirm => 'Confirm';

  @override
  String get failed_to_load => 'Failed to load';

  @override
  String get not_found => 'Nothing was found :(';

  @override
  String get not_found_filters => 'According to your filters, nothing was found :(';

  @override
  String get try_again => 'Try again';

  @override
  String get reset_filters => 'Reset filters';

  @override
  String get splash_title => 'Introducing Innopolis';

  @override
  String get splash_description => 'Choose a guide, places to visit and a convenient time for you.\nWe are friends with the leading guides of Innopolis.';

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
  String get auth_name_empty => 'The name is required to fill in';

  @override
  String get auth_email_empty => 'The email is required to fill in';

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
  String get sign_in_description => 'To continue, log in to your account.';

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

  @override
  String get date_selection_title => 'Create your excursion!';

  @override
  String get date_selection_description => 'Choose a date and time,\nand we will select the places for you';

  @override
  String get date_selection_city_label => 'City';

  @override
  String get date_selection_city_placeholder => 'Choose city...';

  @override
  String get date_selection_city_warning => 'We are testing only in Innopolis.\nOther cities will be added later';

  @override
  String get date_selection_date_time_label => 'Date and time';

  @override
  String get date_selection_date_time_placeholder => 'Choose date...';

  @override
  String get date_selection_popular_excursions => 'Popular excursions';

  @override
  String get planning_title_placeholder => 'New excursion';

  @override
  String get planning_title_error => 'Name must not be empty';

  @override
  String get planning_description => 'Fill your day with places to visit';

  @override
  String get planning_sheet_title => 'New place';

  @override
  String get planning_sheet_catalog => 'Catalog';

  @override
  String get planning_dialog_title => 'Provide information about the visit';

  @override
  String get planning_dialog_duration_label => 'Duration of the visit (in hours)';

  @override
  String get planning_dialog_duration_error_invalid_input => 'Specify a positive number';

  @override
  String get planning_dialog_duration_error_too_long => 'Duration is too long';

  @override
  String get overview_description => 'Check out the places to visit and create a guided tour';

  @override
  String get excursion_end_of_tour => 'End of the tour';
}
