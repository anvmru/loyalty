import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../data/testdata.dart';
import '../utils/const.dart';
import '../model/loyalty_level.dart';
import '../model/portfolio.dart';
import '../model/purchase.dart';
import '../model/user.dart';

class DataProvider with ChangeNotifier{
  Portfolio _portfolio;

  User get user => _portfolio.user;
  set user(value) => _portfolio.user = value;

  // Уровни в программе лояльности (ПЛ)
  List<LoyaltyLevel> get levels => _portfolio.loyaltyProg.levels;

  // Покупки (все, не только по этой программе)
  List<Purchase> get purchases => _portfolio.purchases;

  // Имя ПЛ
  String get lpName => _portfolio.loyaltyProg.name;

  // Остаток бонусов
  double get remainingBonuses => _getRemainingBonuses();

  // Флаг готовности загрузки данных после инициализации
  bool _ready = false;
  Future<bool> get ready => _ready ? _ready : Future.delayed(Duration(seconds: 1), () => _ready) ;

  DataProvider() {
    _portfolio = GenTestData.portfolioTest();
    loadData().then((value) => _ready = true);
  }

  double _getRemainingBonuses() {
    double rb = _portfolio.loyaltyProg.bonuses ?? 0.0;
    String loyaltyProgId = _portfolio.loyaltyProg.id;
    for(var purch in _portfolio?.purchases) {
      if(purch.loyaltyProgId == loyaltyProgId) rb -= purch.bonusPay;
    }
    return (rb < 0 ? 0.0 : rb);
  }

  Future<void> saveData() async {
    try {
      final LocalStorage _storage = LocalStorage(kStorageCatalog);
      await _storage.ready;
      if (_portfolio.user.state == UserState.Undefine
          && _portfolio.user?.email != null) {
        _portfolio.user.state = UserState.Login;
      }
      await _storage.setItem(kStorageUser, _portfolio.user);
      notifyListeners();
    } catch (e) {
      print("* DataProvider.saveData: Error=${e.toString()}");
    }
  }

  Future<bool> loadData() async {
    bool res = false;
    try {
      final LocalStorage _storage = LocalStorage(kStorageCatalog);
      await _storage.ready;
      _portfolio.user = User.fromJson(_storage.getItem(kStorageUser));
      if(_portfolio.user == null) {
        _portfolio.user = User();
      } else {
        res = true;
      }
    } catch (e) {
      print("* DataProvider.loadData: Error=${e.toString()}");
    }
    return res;
  }

  Future<void> login(BuildContext context) async {
    _portfolio.user.state = UserState.Login;
    await saveData();
  }

  Future<void> logout(BuildContext context) async {
    _portfolio.user.state = UserState.Logout;
    await saveData();
  }
}