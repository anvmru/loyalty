import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../providers/data_provider.dart';
import '../utils/const.dart';
import '../widget/btn_login.dart';
import '../widget/title_login.dart';

// Model
class RegModel {
  DataProvider _dataProvider;
  User get user => _dataProvider.user;

  RegModel(BuildContext context) {
    _dataProvider = Provider.of<DataProvider>(context);
  }
}

// Controller
class RegController {
  final BuildContext context;
  RegModel _rm;
  User get user => _rm.user;

  RegController(this.context) {
    _rm = RegModel(context);
  }

  void registration() {
    print("* RegController.registration");
    Navigator.of(context).pop();
  }

  String checkNotEmpty(String value) {
    user.firstName = value;
    return ((value.length == 0) ? gLocale.check_notempty : null);
  }

  String checkPwd(String value) {
    user.pwd = value;
    return ((value.length == 0) ? gLocale.check_pwd : null);
  }
}

// View
class RegPage extends StatefulWidget {
  static const id = 'reg_page';
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecName = TextEditingController();
  final TextEditingController tecSurname = TextEditingController();
  final TextEditingController tecPatronymic = TextEditingController();
  final TextEditingController tecPhone = TextEditingController();
  final TextEditingController tecPwd = TextEditingController();
  final TextEditingController tecPwd2 = TextEditingController();
  final TextEditingController tecBirthday = TextEditingController();

  final ButtonStyle buttonStyle = ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(16.0)));

  Size sizeApp;
  TextStyle titleStyle;
  RegController _rc;

  @override
  void didChangeDependencies() {
    _rc = RegController(context);
    final DateFormat format = DateFormat("dd.MM.yyyy");

    tecEmail.text = _rc.user.email;
    tecName.text = _rc.user.firstName;
    tecSurname.text = _rc.user.lastName;
    tecPatronymic.text = _rc.user.middleName;
    tecPhone.text = _rc.user.phoneNumber;
    tecPwd.text = "";
    tecPwd2.text = "";
    tecBirthday.text = format.format(_rc.user.birthday);

    titleStyle = Theme.of(context).textTheme.headline6;
    sizeApp = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(gLocale.bar_reg), centerTitle: true),
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
                  validator: (value) => _rc.checkNotEmpty(value),
                )),
            // Имя
            ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
              controller: tecName,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(hintText: gLocale.user_name),
              validator: (value) => _rc.checkNotEmpty(value),
            )),
            // Фамилия
            ListTile(
                leading: const Icon(Icons.people),
                title: TextFormField(
              controller: tecSurname,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(hintText: gLocale.user_surname),
              validator: (value) => _rc.checkNotEmpty(value),
            )),
            // Отчество
            ListTile(
              leading: const Icon(Icons.people_alt_outlined),
              title: TextFormField(
              controller: tecPatronymic,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(hintText: gLocale.user_paronymic),
              validator: (value) => _rc.checkNotEmpty(value),
            )),
            // Телефон
            ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                  controller: tecPhone,
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(hintText: gLocale.user_phone),
                  validator: (value) => _rc.checkNotEmpty(value),
                )),
            // Дата рождения
            ListTile(
                leading: const Icon(Icons.local_florist),
                title: TextFormField(
                  controller: tecBirthday,
//                  keyboardType: TextInputType.datetime,
                  decoration: new InputDecoration(hintText: gLocale.user_birthday),
                  validator: (value) => _rc.checkNotEmpty(value),
                  onTap: () => _selectDate(context),
                )),

            // Пароль
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: TextFormField(
                controller: tecPwd,
                decoration: new InputDecoration(hintText: gLocale.user_pwd),
                obscureText: true,
                validator: (value) => _rc.checkNotEmpty(value),
              ),
            ),
            // Пароль2
            ListTile(
                leading: const Icon(Icons.vpn_key_outlined),
                title: TextFormField(
                  controller: tecPwd2,
                  decoration: new InputDecoration(hintText: gLocale.user_pwd2),
                  obscureText: true,
                  validator: (value) => _checkPwd(value),
                )),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),

            // Кнопки
            BtnLogin(context, gLocale.btn_registration, _rc.registration),
          ])),
    );
  }

  String _checkPwd(String value) {
    return ((tecPwd.text == value) ? gLocale.check_pwd_noequal : null);
  }

  @override
  void dispose() {
    tecEmail.dispose();
    tecName.dispose();
    tecSurname.dispose();
    tecPatronymic.dispose();
    tecPhone.dispose();
    tecPwd.dispose();
    tecPwd2.dispose();
    tecBirthday.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateFormat formatter = DateFormat('dd.MM.yyyy');//specifies day/month/year format

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _rc.user.birthday,
        firstDate: DateTime(1920),
        lastDate: DateTime.now(),
    );
    if (picked != null && picked != _rc.user.birthday)
      setState(() {
        _rc.user.birthday = picked;
        //Use formatter to format selected date and assign to text field
        tecBirthday.value = TextEditingValue(text: formatter.format(picked));
      });
  }
}
