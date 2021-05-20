import 'package:flutter/material.dart';
import '../utils/const.dart';

//  Заставка
Widget error(BuildContext context, String msg) {
  return Scaffold(
    backgroundColor: Colors.indigo, //.purple,
    body: Container(
      child: Center(
        child: Padding(padding: EdgeInsets.all(24.0), child:
        Text(msg,
          style: kSplashStyle,
          textAlign: TextAlign.center,
        )),
      ),
    ),
  );
}