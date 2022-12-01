// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SKIP`
  String get intro_page_skip {
    return Intl.message(
      'SKIP',
      name: 'intro_page_skip',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get intro_page_next {
    return Intl.message(
      'NEXT',
      name: 'intro_page_next',
      desc: '',
      args: [],
    );
  }

  /// `BACK`
  String get intro_page_back {
    return Intl.message(
      'BACK',
      name: 'intro_page_back',
      desc: '',
      args: [],
    );
  }

  /// `Manage your tasks`
  String get intro_page_one_description_title {
    return Intl.message(
      'Manage your tasks',
      name: 'intro_page_one_description_title',
      desc: '',
      args: [],
    );
  }

  /// `You can easily manage all of your daily tasks in UpTodo for free`
  String get intro_page_one_description_detail {
    return Intl.message(
      'You can easily manage all of your daily tasks in UpTodo for free',
      name: 'intro_page_one_description_detail',
      desc: '',
      args: [],
    );
  }

  /// `Create daily routine`
  String get intro_page_two_description_title {
    return Intl.message(
      'Create daily routine',
      name: 'intro_page_two_description_title',
      desc: '',
      args: [],
    );
  }

  /// `In UpTodo you can create your personalized routine to stay productive`
  String get intro_page_two_description_detail {
    return Intl.message(
      'In UpTodo you can create your personalized routine to stay productive',
      name: 'intro_page_two_description_detail',
      desc: '',
      args: [],
    );
  }

  /// `Organize your tasks`
  String get intro_page_three_description_title {
    return Intl.message(
      'Organize your tasks',
      name: 'intro_page_three_description_title',
      desc: '',
      args: [],
    );
  }

  /// `You can organize your daily tasks by adding your tasks into separate categories`
  String get intro_page_three_description_detail {
    return Intl.message(
      'You can organize your daily tasks by adding your tasks into separate categories',
      name: 'intro_page_three_description_detail',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to UpTodo`
  String get intro_page_last_description_title {
    return Intl.message(
      'Welcome to UpTodo',
      name: 'intro_page_last_description_title',
      desc: '',
      args: [],
    );
  }

  /// `Please login to your account or create new account to continue`
  String get intro_page_last_description_detail {
    return Intl.message(
      'Please login to your account or create new account to continue',
      name: 'intro_page_last_description_detail',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `CREATE ACCOUNT`
  String get register {
    return Intl.message(
      'CREATE ACCOUNT',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get login_register_page_title_register {
    return Intl.message(
      'Register',
      name: 'login_register_page_title_register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_register_page_title_login {
    return Intl.message(
      'Login',
      name: 'login_register_page_title_login',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get login_register_page_input_field_title_username {
    return Intl.message(
      'Username',
      name: 'login_register_page_input_field_title_username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_register_page_input_field_title_password {
    return Intl.message(
      'Password',
      name: 'login_register_page_input_field_title_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get login_register_page_input_field_title_password_confirm {
    return Intl.message(
      'Confirm Password',
      name: 'login_register_page_input_field_title_password_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please input username`
  String get login_register_page_input_field_placeholder_username {
    return Intl.message(
      'Please input username',
      name: 'login_register_page_input_field_placeholder_username',
      desc: '',
      args: [],
    );
  }

  /// `Please input password`
  String get login_register_page_input_field_placeholder_password {
    return Intl.message(
      'Please input password',
      name: 'login_register_page_input_field_placeholder_password',
      desc: '',
      args: [],
    );
  }

  /// `Please input password again`
  String get login_register_page_input_field_placeholder_password_confirm {
    return Intl.message(
      'Please input password again',
      name: 'login_register_page_input_field_placeholder_password_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get login_register_page_button_register {
    return Intl.message(
      'Register',
      name: 'login_register_page_button_register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_register_page_button_login {
    return Intl.message(
      'Login',
      name: 'login_register_page_button_login',
      desc: '',
      args: [],
    );
  }

  /// `Register with Google`
  String get login_register_page_button_register_with_google {
    return Intl.message(
      'Register with Google',
      name: 'login_register_page_button_register_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Register with Apple`
  String get login_register_page_button_register_with_apple {
    return Intl.message(
      'Register with Apple',
      name: 'login_register_page_button_register_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get login_register_page_button_login_with_google {
    return Intl.message(
      'Login with Google',
      name: 'login_register_page_button_login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get login_register_page_button_login_with_apple {
    return Intl.message(
      'Login with Apple',
      name: 'login_register_page_button_login_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?`
  String get login_register_page_login_tips {
    return Intl.message(
      'Already have account?',
      name: 'login_register_page_login_tips',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_register_page_register_tips {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_register_page_register_tips',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get login_register_page_divider_text {
    return Intl.message(
      'or',
      name: 'login_register_page_divider_text',
      desc: '',
      args: [],
    );
  }

  /// `Index`
  String get home_page_bottom_app_bar_index {
    return Intl.message(
      'Index',
      name: 'home_page_bottom_app_bar_index',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get home_page_bottom_app_bar_calendar {
    return Intl.message(
      'Calendar',
      name: 'home_page_bottom_app_bar_calendar',
      desc: '',
      args: [],
    );
  }

  /// `Focus`
  String get home_page_bottom_app_bar_focus {
    return Intl.message(
      'Focus',
      name: 'home_page_bottom_app_bar_focus',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get home_page_bottom_app_bar_profile {
    return Intl.message(
      'Profile',
      name: 'home_page_bottom_app_bar_profile',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to do today?`
  String get index_body_empty_notice {
    return Intl.message(
      'What do you want to do today?',
      name: 'index_body_empty_notice',
      desc: '',
      args: [],
    );
  }

  /// `Tap + to add your tasks`
  String get index_body_empty_tips {
    return Intl.message(
      'Tap + to add your tasks',
      name: 'index_body_empty_tips',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
