import 'package:flutter/material.dart';

import '../data/data_provider.dart';
import '../presentation/main_page.dart';
import '../presentation/registration.dart';
import '../utils/const.dart';

// Controller
class LoginController with ChangeNotifier {
  final BuildContext context;
  final DataProvider _dp;
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecPsw = TextEditingController();

  LoginController(this.context, this._dp) {
    print("* LoginController()");
    tecEmail.text = _dp.user?.email ?? "";
  }

  Future<void> login(BuildContext context) async {
    if(tecPsw.text == _dp.user.pwd &&
        tecEmail.text == _dp.user.email) {
      await _dp.login(context);
      Navigator.of(context).pushNamedAndRemoveUntil(MainPage.id, (route) => false);
    };
  }

  void registration(BuildContext context) {
    Navigator.of(context).pushNamed(RegPage.id);
  }

  String checkEmail(String value) {
    return ((value.length == 0) ? gLocale.check_name : null);
  }

  String checkPwd(String value) {
    return ((value.length == 0 || value != _dp.user.pwd)
        ? gLocale.check_pwd : null);
  }

  void dispose() {
    tecEmail.dispose();
    tecPsw.dispose();
  }
}
