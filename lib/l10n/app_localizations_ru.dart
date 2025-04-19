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
  String get continue_txt => 'Продолжить';

  @override
  String get next => 'Далее';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get ok => 'ОК';

  @override
  String get failed_to_load => 'Не получилось загрузить';

  @override
  String get not_found => 'Ничего не нашлось :(';

  @override
  String get not_found_filters => 'Согласно вашим фильтрам\nничего не нашлось :(';

  @override
  String get try_again => 'Повторить';

  @override
  String get something_went_wrong_try_again_later => 'Что-то пошло не так.\nПопробуйте еще раз';

  @override
  String get reset_filters => 'Сбросить фильтры';

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
  String get auth_password_not_match => 'Пароли не совпадают';

  @override
  String get auth_invalid_credentials => 'Неправильный логин или пароль';

  @override
  String get sign_up_title => 'Регистрация';

  @override
  String get sign_up_description => 'Создайте свой аккаунт и начните собирать экскурсии уже сейчас.';

  @override
  String get sign_up_go_sign_in_label => 'Уже есть аккаунт?';

  @override
  String get sign_up_failed => 'Не получилось зарегистрироваться';

  @override
  String get sign_in_title => 'Авторизация';

  @override
  String get sign_in_description => 'Чтобы продолжить, войдите в свой аккаунт.';

  @override
  String get sign_in_go_sign_up_label => 'Нет аккаунта?';

  @override
  String get sign_in_failed => 'Не получилось авторизоваться';

  @override
  String get main_tab_catalog => 'Каталог';

  @override
  String get main_tab_excursions => 'Экскурсии';

  @override
  String get main_tab_profile => 'Профиль';

  @override
  String get excursions_step1 => 'Выбор даты';

  @override
  String get excursions_step2 => 'Планирование';

  @override
  String get excursions_step3 => 'Просмотр';

  @override
  String get date_selection_title => 'Создайте свою экскурсию!';

  @override
  String get date_selection_description => 'Выберите дату и время,\nа мы подберём для вас места';

  @override
  String get date_selection_city_label => 'Город';

  @override
  String get date_selection_city_placeholder => 'Выберите город...';

  @override
  String get date_selection_city_warning => 'Тестируем только в г. Иннополис.\nПостепенно добавим новые города';

  @override
  String get date_selection_date_time_label => 'Дата и время';

  @override
  String get date_selection_date_time_placeholder => 'Выберите дату...';

  @override
  String get date_selection_popular_excursions => 'Популярные экскурсии';

  @override
  String get planning_title_placeholder => 'Новая экскурсия';

  @override
  String get planning_title_error => 'Имя не может быть пустым';

  @override
  String get planning_description => 'Заполните ваш день местами для посещения';

  @override
  String get planning_sheet_title => 'Новое место';

  @override
  String get planning_sheet_catalog => 'Каталог';

  @override
  String get planning_dialog_title => 'Укажите информацию о посещении';

  @override
  String get planning_dialog_duration_label => 'Длительность посещения (в часах)';

  @override
  String get planning_dialog_duration_error_invalid_input => 'Укажите положительное число';

  @override
  String get planning_dialog_duration_error_too_long => 'Длительность слишком велика';

  @override
  String get overview_description => 'Проверьте места для посещения и создайте экскурсию';

  @override
  String get overview_create_excursion => 'Создать экскурсию';

  @override
  String get finish_title => 'Экскурсия успешно создана!';

  @override
  String get finish_description => 'Теперь вы сможете её просмотреть в своём профиле :)';

  @override
  String get finish_confirm => 'Перейти в профиль';

  @override
  String get excursion_end_of_tour => 'Конец экскурсии';

  @override
  String hours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString часов',
      few: '3 часа',
      two: '2 часа',
      one: '1 час',
      zero: 'меньше часа',
    );
    return '$_temp0';
  }
}
