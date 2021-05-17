import 'package:flutter/material.dart';

Widget BtnLogin(BuildContext context, String text, Function operate) {

  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.2,
        vertical: MediaQuery.of(context).size.height * 0.03),
    child: ElevatedButton(
      child: Text(text),
      onPressed: () => operate(),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(16.0))
      ),
      clipBehavior: Clip.none,
    ),
  );
}
