// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get app_name => 'Pole';

  @override
  String get splash_title => 'Познакомим с Иннополисом';

  @override
  String get splash_description => 'Подберите гида, места для посещения и удобное вам время.\nДружим с ведущими гидами Иннополиса.';

  @override
  String get splash_sign_up => 'Начать путешествие';

  @override
  String get splash_sign_in => 'Войти';

  @override
  String get auth_sign_up => 'Зарегистрироваться';

  @override
  String get auth_sign_in => 'Войти';

  @override
  String get auth_enter_name => 'Введите имя';

  @override
  String get auth_enter_email => 'Введите email';

  @override
  String get auth_enter_password => 'Введите пароль';

  @override
  String get auth_confirm_password => 'Повторите пароль';

  @override
  String get auth_name_empty => 'Имя обязательно для заполнения';

  @override
  String get auth_email_empty => 'Email обязателен для заполнения';

  @override
  String get auth_password_weak => 'Пароль должен быть от 8 символов';

  @override
  String get auth_password_not_match => 'Пароли не совпадают';

  @override
  String get auth_invalid_credentials => 'Неправильный логин или пароль';

  @override
  String get sign_up_title => 'Регистрация';

  @override
  String get sign_up_description => 'Создайте свой аккаунт и начните собирать экскурсии уже сейчас.';

  @override
  String get sign_up_go_sign_in_label => 'Уже есть аккаунт?';

  @override
  String get sign_in_title => 'Авторизация';

  @override
  String get sign_in_description => 'Чтобы продолжить, войдите в свой аккаунт.';

  @override
  String get sign_in_go_sign_up_label => 'Нет аккаунта?';
}
