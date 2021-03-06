import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

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
}
