import 'package:flutter/material.dart';
import 'package:loyalty/model/portfolio.dart';
import '../model/purchase.dart';
import '../model/user.dart';

class DataProvider with ChangeNotifier{
  Portfolio _portfolio;
  User get user => _portfolio.user;
  set user(value) => _portfolio.user = value;

  String get lpName => _portfolio.loyaltyProg.name;
  double get remainingBonuses => _getRemainingBonuses();

  DataProvider() {
    _portfolio = Portfolio.test();
  }

  double _getRemainingBonuses() {
    double rb = _portfolio.loyaltyProg.bonuses ?? 0.0;
    String loyaltyProgId = _portfolio.loyaltyProg.id;
    for(var purch in _portfolio?.purchases) {
      if(purch.loyaltyProgId == loyaltyProgId) rb -= purch.bonusPay;
    }
    return (rb < 0 ? 0.0 : rb);
  }

  Stream<Purchase> fetchPurchase() async* {
    if(_portfolio.purchases.length == 0) {

    }
    String loyaltyProgId = _portfolio.loyaltyProg.id;
    for(Purchase purch in _portfolio.purchases) {
      if(purch.loyaltyProgId == loyaltyProgId) yield purch;
    }
  }

  Future<void> saveUser() async {
    notifyListeners();
  }
  Future<void> load() async {
    notifyListeners();
  }
}