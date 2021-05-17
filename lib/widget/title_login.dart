import 'package:flutter/material.dart';
import '../utils/const.dart';

Widget TitleLogin(BuildContext context, String title) {
  return Column(children: <Widget>[
    Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5, maxHeight: MediaQuery.of(context).size.height * 0.3),
        child: Image.asset(kLogo)),
    Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.02, horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ))
  ]);
}
