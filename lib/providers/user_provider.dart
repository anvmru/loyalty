import 'package:flutter/material.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier{
  User _user;
  User get user => _user;
  set user(value) => _user = value;

  UserProvider() {
    _user = User(birthday: DateTime.now());
  }

  Future<void> save() async {
    notifyListeners();
  }
  Future<void> load() async {
    notifyListeners();
  }
}