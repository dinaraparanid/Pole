import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Pole'**
  String get app_name;

  /// No description provided for @continue_txt.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_txt;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @failed_to_load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get failed_to_load;

  /// No description provided for @not_found.
  ///
  /// In en, this message translates to:
  /// **'Nothing was found :('**
  String get not_found;

  /// No description provided for @not_found_filters.
  ///
  /// In en, this message translates to:
  /// **'According to your filters, nothing was found :('**
  String get not_found_filters;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get try_again;

  /// No description provided for @reset_filters.
  ///
  /// In en, this message translates to:
  /// **'Reset filters'**
  String get reset_filters;

  /// No description provided for @splash_title.
  ///
  /// In en, this message translates to:
  /// **'Introducing Innopolis'**
  String get splash_title;

  /// No description provided for @splash_description.
  ///
  /// In en, this message translates to:
  /// **'Choose a guide, places to visit and a convenient time for you.\nWe are friends with the leading guides of Innopolis.'**
  String get splash_description;

  /// No description provided for @splash_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Begin journey'**
  String get splash_sign_up;

  /// No description provided for @splash_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get splash_sign_in;

  /// No description provided for @auth_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_sign_up;

  /// No description provided for @auth_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get auth_sign_in;

  /// No description provided for @auth_enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get auth_enter_name;

  /// No description provided for @auth_enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get auth_enter_email;

  /// No description provided for @auth_enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get auth_enter_password;

  /// No description provided for @auth_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get auth_confirm_password;

  /// No description provided for @auth_name_empty.
  ///
  /// In en, this message translates to:
  /// **'The name is required to fill in'**
  String get auth_name_empty;

  /// No description provided for @auth_email_empty.
  ///
  /// In en, this message translates to:
  /// **'The email is required to fill in'**
  String get auth_email_empty;

  /// No description provided for @auth_password_weak.
  ///
  /// In en, this message translates to:
  /// **'The password must be at least 8 characters long.'**
  String get auth_password_weak;

  /// No description provided for @auth_password_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get auth_password_not_match;

  /// No description provided for @auth_invalid_credentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid login or password'**
  String get auth_invalid_credentials;

  /// No description provided for @sign_up_title.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get sign_up_title;

  /// No description provided for @sign_up_description.
  ///
  /// In en, this message translates to:
  /// **'Create your account and start touring now'**
  String get sign_up_description;

  /// No description provided for @sign_up_go_sign_in_label.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get sign_up_go_sign_in_label;

  /// No description provided for @sign_in_title.
  ///
  /// In en, this message translates to:
  /// **'Authorization'**
  String get sign_in_title;

  /// No description provided for @sign_in_description.
  ///
  /// In en, this message translates to:
  /// **'To continue, log in to your account.'**
  String get sign_in_description;

  /// No description provided for @sign_in_go_sign_up_label.
  ///
  /// In en, this message translates to:
  /// **'No account?'**
  String get sign_in_go_sign_up_label;

  /// No description provided for @main_tab_catalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get main_tab_catalog;

  /// No description provided for @main_tab_excursions.
  ///
  /// In en, this message translates to:
  /// **'Excursions'**
  String get main_tab_excursions;

  /// No description provided for @main_tab_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get main_tab_profile;

  /// No description provided for @excursions_step1.
  ///
  /// In en, this message translates to:
  /// **'Date selection'**
  String get excursions_step1;

  /// No description provided for @excursions_step2.
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get excursions_step2;

  /// No description provided for @excursions_step3.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get excursions_step3;

  /// No description provided for @date_selection_title.
  ///
  /// In en, this message translates to:
  /// **'Create your excursion!'**
  String get date_selection_title;

  /// No description provided for @date_selection_description.
  ///
  /// In en, this message translates to:
  /// **'Choose a date and time,\nand we will select the places for you'**
  String get date_selection_description;

  /// No description provided for @date_selection_city_label.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get date_selection_city_label;

  /// No description provided for @date_selection_city_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Choose city...'**
  String get date_selection_city_placeholder;

  /// No description provided for @date_selection_city_warning.
  ///
  /// In en, this message translates to:
  /// **'We are testing only in Innopolis.\nOther cities will be added later'**
  String get date_selection_city_warning;

  /// No description provided for @date_selection_date_time_label.
  ///
  /// In en, this message translates to:
  /// **'Date and time'**
  String get date_selection_date_time_label;

  /// No description provided for @date_selection_date_time_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Choose date...'**
  String get date_selection_date_time_placeholder;

  /// No description provided for @date_selection_popular_excursions.
  ///
  /// In en, this message translates to:
  /// **'Popular excursions'**
  String get date_selection_popular_excursions;

  /// No description provided for @planning_title_placeholder.
  ///
  /// In en, this message translates to:
  /// **'New excursion'**
  String get planning_title_placeholder;

  /// No description provided for @planning_title_error.
  ///
  /// In en, this message translates to:
  /// **'Name must not be empty'**
  String get planning_title_error;

  /// No description provided for @planning_description.
  ///
  /// In en, this message translates to:
  /// **'Fill your day with places to visit'**
  String get planning_description;

  /// No description provided for @planning_sheet_title.
  ///
  /// In en, this message translates to:
  /// **'New place'**
  String get planning_sheet_title;

  /// No description provided for @planning_sheet_catalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get planning_sheet_catalog;

  /// No description provided for @planning_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Provide information about the visit'**
  String get planning_dialog_title;

  /// No description provided for @planning_dialog_duration_label.
  ///
  /// In en, this message translates to:
  /// **'Duration of the visit (in hours)'**
  String get planning_dialog_duration_label;

  /// No description provided for @planning_dialog_duration_error_invalid_input.
  ///
  /// In en, this message translates to:
  /// **'Specify a positive number'**
  String get planning_dialog_duration_error_invalid_input;

  /// No description provided for @planning_dialog_duration_error_too_long.
  ///
  /// In en, this message translates to:
  /// **'Duration is too long'**
  String get planning_dialog_duration_error_too_long;

  /// No description provided for @overview_description.
  ///
  /// In en, this message translates to:
  /// **'Check out the places to visit and create a guided tour'**
  String get overview_description;

  /// No description provided for @overview_create_excursion.
  ///
  /// In en, this message translates to:
  /// **'Create tour'**
  String get overview_create_excursion;

  /// No description provided for @finish_title.
  ///
  /// In en, this message translates to:
  /// **'Tour is successfully created!'**
  String get finish_title;

  /// No description provided for @finish_description.
  ///
  /// In en, this message translates to:
  /// **'Now you can see it in your profile :)'**
  String get finish_description;

  /// No description provided for @finish_confirm.
  ///
  /// In en, this message translates to:
  /// **'Go to profile'**
  String get finish_confirm;

  /// No description provided for @excursion_end_of_tour.
  ///
  /// In en, this message translates to:
  /// **'End of the tour'**
  String get excursion_end_of_tour;

  /// Number of hours
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{less than an hour} =1{1 hour} other{{count} hours}}'**
  String hours(num count);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
