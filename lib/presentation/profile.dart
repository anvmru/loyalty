import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';

class ProfilePage extends StatelessWidget {
  static const id = 'profile_page';

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

