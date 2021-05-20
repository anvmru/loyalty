import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/const.dart';

class QrCode extends StatelessWidget {
  static const id = 'qr_code';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImage(
        backgroundColor: Colors.white,
        data: kMyLink,
        size: 0.75 * MediaQuery.of(context).size.width,
      ),
    );
  }
}
