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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loayalty program`
  String get app_name {
    return Intl.message(
      'Loayalty program',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Loayalty program`
  String get splash_text {
    return Intl.message(
      'Loayalty program',
      name: 'splash_text',
      desc: '',
      args: [],
    );
  }

  /// `Loyality.HD`
  String get title_login {
    return Intl.message(
      'Loyality.HD',
      name: 'title_login',
      desc: '',
      args: [],
    );
  }

  /// `Cabinet`
  String get bar_cabinet {
    return Intl.message(
      'Cabinet',
      name: 'bar_cabinet',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bar_profile {
    return Intl.message(
      'Profile',
      name: 'bar_profile',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get bar_login {
    return Intl.message(
      'Login',
      name: 'bar_login',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get bar_reg {
    return Intl.message(
      'Registration',
      name: 'bar_reg',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty program`
  String get bar_lp {
    return Intl.message(
      'Loyalty program',
      name: 'bar_lp',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get fab_qr {
    return Intl.message(
      'QR',
      name: 'fab_qr',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get user_name {
    return Intl.message(
      'Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get user_surname {
    return Intl.message(
      'Surname',
      name: 'user_surname',
      desc: '',
      args: [],
    );
  }

  /// `Paronymic`
  String get user_paronymic {
    return Intl.message(
      'Paronymic',
      name: 'user_paronymic',
      desc: '',
      args: [],
    );
  }

  /// `Login (email)`
  String get user_email {
    return Intl.message(
      'Login (email)',
      name: 'user_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get user_phone {
    return Intl.message(
      'Phone',
      name: 'user_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get user_pwd {
    return Intl.message(
      'Password',
      name: 'user_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get user_pwd2 {
    return Intl.message(
      'Password confirmation',
      name: 'user_pwd2',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get user_birthday {
    return Intl.message(
      'Birthday',
      name: 'user_birthday',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get lp_card {
    return Intl.message(
      'Card number',
      name: 'lp_card',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty program`
  String get lp_name {
    return Intl.message(
      'Loyalty program',
      name: 'lp_name',
      desc: '',
      args: [],
    );
  }

  /// `Number of active bonuses`
  String get lp_bonuses {
    return Intl.message(
      'Number of active bonuses',
      name: 'lp_bonuses',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get lp_description {
    return Intl.message(
      'Description',
      name: 'lp_description',
      desc: '',
      args: [],
    );
  }

  /// `Description of levels`
  String get lp_desc_level {
    return Intl.message(
      'Description of levels',
      name: 'lp_desc_level',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get lp_t1 {
    return Intl.message(
      'Level',
      name: 'lp_t1',
      desc: '',
      args: [],
    );
  }

  /// `For each payment`
  String get lp_t2 {
    return Intl.message(
      'For each payment',
      name: 'lp_t2',
      desc: '',
      args: [],
    );
  }

  /// `Bonuses are accrued`
  String get lp_t3 {
    return Intl.message(
      'Bonuses are accrued',
      name: 'lp_t3',
      desc: '',
      args: [],
    );
  }

  /// `Purchase date`
  String get purchase_date {
    return Intl.message(
      'Purchase date',
      name: 'purchase_date',
      desc: '',
      args: [],
    );
  }

  /// `Name of shop`
  String get purchase_shop {
    return Intl.message(
      'Name of shop',
      name: 'purchase_shop',
      desc: '',
      args: [],
    );
  }

  /// `Total purchase amount`
  String get purchase_total {
    return Intl.message(
      'Total purchase amount',
      name: 'purchase_total',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty program/Promotion`
  String get purchase_lp {
    return Intl.message(
      'Loyalty program/Promotion',
      name: 'purchase_lp',
      desc: '',
      args: [],
    );
  }

  /// `Bonus payment`
  String get purchase_bonus {
    return Intl.message(
      'Bonus payment',
      name: 'purchase_bonus',
      desc: '',
      args: [],
    );
  }

  /// `Total payable including bonuses`
  String get purchase_payment {
    return Intl.message(
      'Total payable including bonuses',
      name: 'purchase_payment',
      desc: '',
      args: [],
    );
  }

  /// `Purchase amount:`
  String get purchase_amount {
    return Intl.message(
      'Purchase amount:',
      name: 'purchase_amount',
      desc: '',
      args: [],
    );
  }

  /// `Payment by bonuses:`
  String get purchase_payb {
    return Intl.message(
      'Payment by bonuses:',
      name: 'purchase_payb',
      desc: '',
      args: [],
    );
  }

  /// `Remaining bonuses`
  String get remaining {
    return Intl.message(
      'Remaining bonuses',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Data loading error`
  String get err_load_data {
    return Intl.message(
      'Data loading error',
      name: 'err_load_data',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get btn_registration {
    return Intl.message(
      'Registration',
      name: 'btn_registration',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get btn_login {
    return Intl.message(
      'Login',
      name: 'btn_login',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get btn_save {
    return Intl.message(
      'Save',
      name: 'btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your login or email`
  String get check_name {
    return Intl.message(
      'Please enter your login or email',
      name: 'check_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid login`
  String get check_name2 {
    return Intl.message(
      'Please enter a valid login',
      name: 'check_name2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get check_pwd {
    return Intl.message(
      'Please enter a valid password',
      name: 'check_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the field`
  String get check_notempty {
    return Intl.message(
      'Please fill in the field',
      name: 'check_notempty',
      desc: '',
      args: [],
    );
  }

  /// `Passwords are not equal`
  String get check_pwd_noequal {
    return Intl.message(
      'Passwords are not equal',
      name: 'check_pwd_noequal',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty:`
  String get cabinet_lpname {
    return Intl.message(
      'Loyalty:',
      name: 'cabinet_lpname',
      desc: '',
      args: [],
    );
  }

  /// `Remaining bonuses:`
  String get cabinet_remaining {
    return Intl.message(
      'Remaining bonuses:',
      name: 'cabinet_remaining',
      desc: '',
      args: [],
    );
  }

  /// `Purchases`
  String get cabinet_titlelist {
    return Intl.message(
      'Purchases',
      name: 'cabinet_titlelist',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get cabinet_t1 {
    return Intl.message(
      'Date',
      name: 'cabinet_t1',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get cabinet_t2 {
    return Intl.message(
      'Shop',
      name: 'cabinet_t2',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get cabinet_t3 {
    return Intl.message(
      'Payment',
      name: 'cabinet_t3',
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
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}