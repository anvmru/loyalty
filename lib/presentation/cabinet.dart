import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';

class CabinetPage extends StatelessWidget {
  static const id = 'cabinet_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gLocale.bar_cabinet),
        centerTitle: true,
      ),
      body: Container(),
    );
  }

}

