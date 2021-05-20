import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:loyalty/controller/login.dart';
import 'package:loyalty/controller/profile.dart';
import 'package:loyalty/model/user.dart';
import 'package:loyalty/widget/error.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

import 'presentation/cabinet.dart';
import 'presentation/login.dart';
import 'presentation/main_page.dart';
import 'presentation/profile.dart';
import 'presentation/registration.dart';
import 'presentation/loyalty_prog.dart';

import 'data/data_provider.dart';

import 'utils/const.dart';
import 'utils/theme.dart';

import 'widget/qr_code.dart';
import 'widget/splash.dart';

final _navKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runApp(MyApp());
}

Map<String, Widget Function(BuildContext)> menuRoutes = {
  CabinetPage.id: (context) => CabinetPage(),
  ProfilePage.id: (context) => ProfilePage(),
  LoginPage.id: (context) => LoginPage(),
  RegPage.id: (context) => RegPage(),
  MainPage.id: (context) => MainPage(),
  QrCode.id: (context) => QrCode(),
  LoyaltiProgPage.id: (context) => LoyaltiProgPage(),
};

class MyApp extends StatelessWidget {
  DataProvider _dp;
  @override
  Widget build(BuildContext context) {
    _dp = DataProvider();
    final LoginController _lc = LoginController(context, _dp);
    final ProfileController _pc = ProfileController(context, _dp);
    return AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: _dp),
                ChangeNotifierProvider.value(value: _lc),
                ChangeNotifierProvider.value(value: _pc),
              ],
              child: MaterialApp(
                  navigatorKey: _navKey,
                  onGenerateTitle: (context) => S.of(context).app_name,
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme: light,
                  darkTheme: dark,
                  routes: menuRoutes,
                  home: FutureBuilder(
                    future: _loadData(context),
                    builder: (context, snapshot) {
                      // запоминаем для коротких ссылок ниже по тексту
                      gLocale = S.of(_navKey.currentState.overlay.context);
                      // ожидание загрузки из внутренего хранилища и по сети
                      if (snapshot.connectionState != ConnectionState.done) {
                        return mySplash(context);
                      } else {
                        if (snapshot.hasData) {
                          return snapshot.data;
                        }
                        if (snapshot.hasError) {
                          return error(context, "${gLocale.err_load_data} ${snapshot.error.toString()}");
                        }
                      }
                    },
                  )),
            ));
  }

  // Проверка входа
  Future<Widget> _loadData(BuildContext context) async {
    print("* Main._loadData");
    bool r = await _dp.ready;
    print(r ? "* -> ready" : "* -> not ready");
    return (_dp.user?.state == UserState.Login) ? MainPage() : LoginPage();
  }
}
