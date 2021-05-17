import 'package:flutter/material.dart';
import 'package:loyalty/presentation/main_page.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../widget/btn_login.dart';
import '../widget/title_login.dart';
import '../utils/const.dart';
import 'registration.dart';

// Model
enum LoginState { Undefine, Login, Logout }

class LoginModel {
  LoginState loginState;
  String email;
  String pwd;
  UserProvider _userProvider;

  LoginModel(BuildContext context) {
    loginState = LoginState.Undefine;
    _userProvider = Provider.of<UserProvider>(context);
    email = _userProvider.user?.email;
  }

  bool login() {
    print("Model.login()");
    return true;
  }
}

// Controller
class LoginController {
  final BuildContext context;
  LoginModel _lm;
  String get email => _lm.email;

  LoginController(this.context) {
    _lm = LoginModel(context);
  }

  void login() {
    print("* LoginController.login");
    if(_lm?.login()) {
      Navigator.of(context).pop();
    };
  }

  void registration() {
    Navigator.of(context).pushNamed(RegPage.id);
  }

  String checkEmail(String value) {
    _lm.email = value;
    return ((value.length == 0) ? gLocale.check_name : null);
  }
  String checkPwd(String value) {
    _lm.pwd = value;
    return ((value.length == 0) ? gLocale.check_pwd : null);
  }
}

// View
class LoginPage extends StatefulWidget {
  static const id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecPsw = TextEditingController();

  LoginController _lc;

  @override
  void didChangeDependencies() {
    _lc = LoginController(context);
    tecEmail.text = _lc.email;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text(gLocale.bar_login), centerTitle: true),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            // Заголовок
            TitleLogin(context, gLocale.app_name),

            // Логин
            ListTile(
              leading: const Icon(Icons.login),
              title: TextFormField(
                controller: tecEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(hintText: gLocale.user_email),
                validator: (value) => _lc.checkEmail(value),
              ),
            ),

            // Пароль
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: TextFormField(
                  controller: tecPsw,
                  decoration: new InputDecoration(hintText: gLocale.user_pwd),
                  obscureText: true,
                  validator: (value) => _lc.checkPwd(value),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),

            // Кнопки
            BtnLogin(context, gLocale.btn_login, _login),
            BtnLogin(context, gLocale.btn_registration, _lc.registration),
          ])),
    );
  }

  void _login() {
    if(_formKey.currentState.validate()) {
      _lc.login();
    }
  }

  @override
  void dispose() {
    tecEmail.dispose();
    tecPsw.dispose();
    super.dispose();
  }
}
