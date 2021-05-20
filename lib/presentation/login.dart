import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/login.dart';
import '../widget/title_login.dart';
import '../widget/button.dart';
import '../utils/const.dart';

// View
class LoginPage extends StatelessWidget {
  static const id = 'login_page';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginController _lc = Provider.of<LoginController>(context);
    print("* LoginPage.build");

    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            // Заголовок
            TitleLogin(context, gLocale.app_name),

            // Логин
            ListTile(
              leading: const Icon(Icons.login),
              title: TextFormField(
                controller: _lc.tecEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(hintText: gLocale.user_email),
                validator: (value) => _lc.checkEmail(value),
              ),
            ),

            // Пароль
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: TextFormField(
                  controller: _lc.tecPsw,
                  decoration: new InputDecoration(hintText: gLocale.user_pwd),
                  obscureText: true,
                  validator: (value) => _lc.checkPwd(value),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),

            // Кнопки
            Button(context, gLocale.btn_login, _login),
            Button(context, gLocale.btn_registration, _lc.registration),
          ])),
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Provider.of<LoginController>(context, listen: false).login(context);
    }
  }
}
