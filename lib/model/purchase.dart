import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
import '../utils/util.dart';

part "purchase.g.dart";

// flutter packages pub run build_runner build

final DateFormat format = DateFormat("yyyyMMdd");

@JsonSerializable()
class Purchase {
  String id;
  DateTime date;
  String shop;
  @JsonKey(name: 'total_pay')
  double totalPay;
  @JsonKey(name: 'bonus_pay')
  double bonusPay;
  @JsonKey(name: 'pay_wo_bonus')
  double payWoBonus;
  String loyaltyProgId;

  Purchase({this.id, this.date, this.shop, this.totalPay, this.bonusPay, this.payWoBonus, this.loyaltyProgId});

  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseToJson(this);

  // Генерация тестового набора данных
  factory Purchase.test(String loyaltyProgId) {
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

}
