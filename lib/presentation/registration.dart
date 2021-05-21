import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';

import '../controller/profile.dart';
import '../utils/const.dart';
import '../widget/button.dart';
import '../widget/title_login.dart';

// View
class RegPage extends StatelessWidget {
  static const id = 'reg_page';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("* RegPage.build");
    final ProfileController _pc = Provider.of<ProfileController>(context);

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
                  controller: _pc.tecEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(hintText: gLocale.user_email),
                  validator: (value) => _pc.checkLogin(value),
                )),

            // Имя
            ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
                  controller: _pc.tecFirstName,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(hintText: gLocale.user_name),
                  validator: (value) => _pc.checkFirstName(value),
                )),

            // Отчество
            ListTile(
                leading: const Icon(Icons.people_alt_outlined),
                title: TextFormField(
                  controller: _pc.tecMiddleName,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(hintText: gLocale.user_paronymic),
                  validator: (value) => _pc.checkMiddleName(value),
                )),

            // Фамилия
            ListTile(
                leading: const Icon(Icons.people),
                title: TextFormField(
                  controller: _pc.tecLastName,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(hintText: gLocale.user_surname),
                  validator: (value) => _pc.checkLastName(value),
                )),

            // Телефон
            ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                  controller: _pc.tecPhone,
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(hintText: gLocale.user_phone),
                  validator: (value) => _pc.checkPhone(value), 
                  inputFormatters: [ PhoneInputFormatter()]
                )),

            // Дата рождения
            ListTile(
                leading: const Icon(Icons.local_florist),
                title: TextFormField(
                  controller: _pc.tecBirthday,
                  keyboardType: TextInputType.datetime,
                  decoration: new InputDecoration(hintText: gLocale.user_birthday),
                  validator: (value) => _pc.checkBirthday(value),
                ),
                trailing:
                    IconButton(icon: Icon(Icons.date_range), onPressed: () async => await _pc.selectDate(context))),

            // Пароль
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: TextFormField(
                controller: _pc.tecPwd,
                decoration: new InputDecoration(hintText: gLocale.user_pwd),
                validator: (value) => _pc.checkPwd(value),
              ),
            ),

            // Пароль2
            ListTile(
                leading: const Icon(Icons.vpn_key_outlined),
                title: TextFormField(
                  controller: _pc.tecPwd2,
                  decoration: new InputDecoration(hintText: gLocale.user_pwd2),
                  validator: (value) => ((_pc.tecPwd.text != value) ? gLocale.check_pwd_noequal : null),
                )),
            // SizedBox(height: MediaQuery.of(context).size.width * 0.1),

            // Кнопки
            Button(context, gLocale.btn_registration, (BuildContext context) {
              if (_formKey.currentState.validate()) {
                _pc.registration(context);
              }
            })
          ])),
    );
  }
}
