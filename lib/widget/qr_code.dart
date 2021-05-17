import 'package:flutter/material.dart';
import '../utils/const.dart';

class QrCode extends StatelessWidget {
  static const id = 'qr_code';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Image.asset(kLogo),
    );
  }

}

