
import 'dart:math';

import 'package:loyalty/model/loyalty_level.dart';
import 'package:loyalty/model/loyalty_prog.dart';
import 'package:loyalty/model/portfolio.dart';
import 'package:loyalty/model/purchase.dart';
import 'package:loyalty/model/user.dart';
import 'package:loyalty/utils/util.dart';

// Генерация тестового набора данных
class GenTestData {

  static Portfolio portfolioTest() {
    LoyaltyProg lpTest = loyaltyProgTest();
    return Portfolio(user: User(), loyaltyProg: lpTest, purchases: getPurchases(lpTest.id));
  }

  static List<Purchase> getPurchases(String lpId) {
    List<Purchase> res = [];
    for(var i=0; i<40; i++) {
      res.add(purchaseTest(lpId));
    }
    res.sort((p1, p2) => p2.date.compareTo(p1.date));
    return res;
  }

  static Purchase purchaseTest(String loyaltyProgId) {
    Random r = Random();
    double randTotal = r.nextDouble() * 4096.0;
    double randBonus = (r.nextDouble() * 256.0).roundToDouble();
    if(randBonus > randTotal) randBonus = (randTotal-1).roundToDouble();
    return Purchase(
        id: Util.getId(),
        date: _getRandomDate(),
        shop: _getRandomShop(),
        totalPay: randTotal,
        bonusPay: randBonus,
        payWoBonus: randTotal - randBonus,
        loyaltyProgId: loyaltyProgId
    );
  }

  static String _getRandomShop() {
    Random r = Random();
    const _shops = ["Лавка хакера", "YourFail", "Манит", "СисАдминистриада", "Пипеточка"];
    return _shops[r.nextInt(5)];
  }

  static DateTime _getRandomDate() {
    Random r = Random();
    int d = r.nextInt(30);
    DateTime res = DateTime.now().add(Duration(days: -d));
    return res;
  }

  static User userTest() {
    return User(
        email: "dart@my.com",
        firstName: "Александр",
        middleName: "Сергеевич",
        lastName: "Пушкин",
        phoneNumber: "+7(913)102-1024",
        pwd: "qwe",
        birthday: DateTime(1999, 6, 6),
        state: UserState.Undefine
    );
  }

  static LoyaltyProg loyaltyProgTest() {
    return LoyaltyProg(
        id: Util.getId(),
        name: "В день защиты детей",
        cardNo: "0123-4567",
        bonuses: 9550.0,
        levels: <LoyaltyLevel>[
          LoyaltyLevel(level: Level.Beginner, payment: 100, bonuses: 10),
          LoyaltyLevel(level: Level.Silver, payment: 1000, bonuses: 20),
          LoyaltyLevel(level: Level.Gold, payment: 5000, bonuses: 100),
          LoyaltyLevel(level: Level.Platinum, payment: 10000, bonuses: 500)
        ]
    );
  }
}