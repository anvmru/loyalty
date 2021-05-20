import 'package:flutter/material.dart';
import '../utils/const.dart';

//  Заставка
Widget mySplash(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.indigo, //.purple,
    body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(24.0), child:
          Text(gLocale.splash_text.toUpperCase(),
            style: kSplashStyle,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    ),
  );
}