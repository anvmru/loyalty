import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'presentation/cabinet.dart';
import 'presentation/login.dart';
import 'presentation/main_page.dart';
import 'presentation/profile.dart';
import 'presentation/registration.dart';
import 'providers/user_provider.dart';
import 'utils/const.dart';
import 'utils/theme.dart';
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
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
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
                return Splash(context);
              } else {
                if (snapshot.hasData) {
                  return snapshot.data;
                } else {
                  print(snapshot.data);
                  return Text(gLocale.err_load_data + "${snapshot.data}");
                }
              }
            },
          )
        ),
      ),
    );
  }

  // Проверка входа
  Future<Widget> _loadData(BuildContext context) async {
//    await repository.loadData();
    return LoginPage();
  }
}
