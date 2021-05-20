import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';
import '../presentation/login.dart';
import '../utils/const.dart';
import '../presentation/loyalty_prog.dart';

Widget _loyaltyProgButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.loyalty),
      onPressed: () => Navigator.pushNamed(context, LoyaltiProgPage.id)
  );
}

Widget _logoutButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.logout),
      onPressed: () {
        DataProvider _dp = Provider.of<DataProvider>(context, listen: false);
        _dp.logout(context);
        Navigator.pushReplacementNamed(context, LoginPage.id);
      }
  );
}

Widget mainAppBar(BuildContext context) {
  return AppBar(
    leading: _loyaltyProgButton(context),
      title: Text(gLocale.bar_profile),
      centerTitle: true,
      actions: [_logoutButton(context)]);
}

