import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
import '../utils/util.dart';

part "purchase.g.dart";

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

  factory Purchase.test(String loyaltyProgId) {
    Random r = Random();
    double randTotal = r.nextDouble() * 4096.0;
    double randBonus = (r.nextDouble() * 512.0).roundToDouble();
    if(randBonus > randTotal) randBonus = randTotal.roundToDouble();
    return Purchase(
        id: Util.getId(),
        date: DateTime.now(),
        shop: "Лавка хакера",
        totalPay: randTotal,
        bonusPay: randBonus,
        payWoBonus: randTotal - randBonus,
        loyaltyProgId: loyaltyProgId
    );
  }
}
