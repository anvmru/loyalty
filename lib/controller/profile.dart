import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyalty/presentation/login.dart';

import '../presentation/main_page.dart';
import '../model/user.dart';
import '../data/data_provider.dart';
import '../utils/const.dart';

// Controller
class ProfileController with ChangeNotifier {
  final BuildContext context;
  final DataProvider _dp;
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecFirstName = TextEditingController();
  final TextEditingController tecLastName = TextEditingController();
  final TextEditingController tecMiddleName = TextEditingController();
  final TextEditingController tecPhone = TextEditingController();
  final TextEditingController tecPwd = TextEditingController();
  final TextEditingController tecPwd2 = TextEditingController();
  final TextEditingController tecBirthday = TextEditingController();
  final DateFormat formatter = DateFormat(kFormatDate);

  bool isEdit = false;

  User get user => _dp.user;
  String get lpName => _dp.lpName;

  ProfileController(this.context, this._dp) {
    iniTec();
    isEdit = false;
  }

  void iniTec() {
    tecEmail.text = _dp.user?.email ?? "";
    tecFirstName.text = _dp.user?.firstName ?? "";
    tecLastName.text = _dp.user?.lastName ?? "";
    tecMiddleName.text = _dp.user?.middleName ?? "";
    tecPhone.text = _dp.user?.phoneNumber ?? "";
    tecBirthday.text = formatter.format(_dp.user?.birthday ?? DateTime(2000, 1, 1));
    tecPwd.text = "";
    tecPwd2.text = "";

    tecFirstName.addListener(() => setEdit(_dp.user?.firstName, tecFirstName.text));
    tecLastName.addListener(() => setEdit(_dp.user?.lastName, tecLastName.text));
    tecMiddleName.addListener(() => setEdit(_dp.user?.middleName, tecMiddleName.text));
    tecPhone.addListener(() => setEdit(_dp.user?.phoneNumber, tecPhone.text));
    tecBirthday.addListener(() => setEdit(formatter.format(_dp.user?.birthday), tecBirthday.text));
  }

  void setEdit(dynamic prev, dynamic curr) {
    if(!isEdit) {
      try {
        if(prev != curr) {
          isEdit = true;
          notifyListeners();
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    await _dp.logout(context);
    Navigator.of(context).pushReplacementNamed(LoginPage.id);
  }

  Future<void> registration(BuildContext context) async {
    await _dp.login(context);
    Navigator.of(context).pushNamedAndRemoveUntil(MainPage.id, (route) => false);
  }

  Future<void> save(BuildContext context) async {
    print("* pc.save");
    await _dp.saveData();
    isEdit = false;
    notifyListeners();
  }

  String _checkIsEmpty(String value) {
    String res = ((value.length == 0) ? gLocale.check_notempty : null);
    return res;
  }

  String checkLogin(String value) {
    _dp.user.email = value;
    return _checkIsEmpty(value);
  }

  String checkFirstName(String value) {
    print("** checkFirstName");
    _dp.user.firstName = value;
    return _checkIsEmpty(value);
  }

  String checkLastName(String value) {
    _dp.user.lastName = value;
    return _checkIsEmpty(value);
  }

  String checkMiddleName(String value) {
    _dp.user.middleName = value;
    return null;
    }

  String checkPhone(String value) {
    _dp.user.phoneNumber = value;
    return _checkIsEmpty(value);
    }

  String checkBirthday(String value) {
    _dp.user.birthday = formatter.parse(value);
    //tecBirthday.text = value;
    return _checkIsEmpty(value);
    }

  String checkPwd(String value) {
    _dp.user.pwd = value;
    return _checkIsEmpty(value);
  }

  @override
  void dispose() {
    super.dispose();
    tecFirstName.removeListener(() => setEdit(_dp.user?.firstName, tecFirstName.text));
    tecLastName.removeListener(() => setEdit(_dp.user?.lastName, tecLastName.text));
    tecMiddleName.removeListener(() => setEdit(_dp.user?.middleName, tecMiddleName.text));
    tecPhone.removeListener(() => setEdit(_dp.user?.phoneNumber, tecPhone.text));
    tecBirthday.removeListener(() => setEdit(formatter.format(_dp.user?.birthday), tecBirthday.text));

    tecEmail.dispose();
    tecFirstName.dispose();
    tecLastName.dispose();
    tecMiddleName.dispose();
    tecPhone.dispose();
    tecPwd.dispose();
    tecPwd2.dispose();
    tecBirthday.dispose();
  }

  Future<void> selectDate(BuildContext context) async {
    DateFormat formatter = DateFormat(kFormatDate);
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: formatter.parse(tecBirthday.text),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != user.birthday) {
      _dp.user.birthday = picked;
      // Форматирование и вывод в поле редактирования
      tecBirthday.value = TextEditingValue(text: formatter.format(picked));
      notifyListeners();
    }
  }
}
