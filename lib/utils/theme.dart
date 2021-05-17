import 'package:flutter/material.dart';

final PageTransitionsTheme kPageTransitionsTheme = PageTransitionsTheme(builders: {
  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
});

final String kFontFamily = "Montserrat";

final ThemeData kLightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: kPageTransitionsTheme,
  textTheme: ThemeData.light().textTheme.apply(fontFamily: kFontFamily),
  primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: kFontFamily),
  accentTextTheme: ThemeData.light().textTheme.apply(fontFamily: kFontFamily),
);

final ThemeData kDarkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: kPageTransitionsTheme,
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: kFontFamily),
    primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: kFontFamily),
    accentTextTheme: ThemeData.dark().textTheme.apply(fontFamily: kFontFamily),
);
