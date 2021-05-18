import 'dart:ui';

import 'package:flutter/material.dart';
import '../utils/const.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  static const id = 'qr_code';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // content: QrImage(
      //     data: "https://github.com/anvmru/loyalty",
      //     version: QrVersions.auto,
      //     size: 320.0,
      //     gapless: false,
      //     semanticsLabel: "Sources of this application",
      //     embeddedImage: AssetImage(kLogo),
      //     embeddedImageStyle: QrEmbeddedImageStyle(size: Size(80, 80)),
      //   errorStateBuilder: (cxt, err) {
      //     return Container(
      //       child: Center(
      //         child: Text(
      //           "Uh oh! Something went wrong...",
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     );
      //   },)
      content: Image.asset(kLogo),
    );
  }
}
