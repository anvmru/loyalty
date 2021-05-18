// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return Purchase(
    id: json['id'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    shop: json['shop'] as String,
    totalPay: (json['total_pay'] as num)?.toDouble(),
    bonusPay: (json['bonus_pay'] as num)?.toDouble(),
    payWoBonus: (json['pay_wo_bonus'] as num)?.toDouble(),
    loyaltyProgId: json['loyaltyProgId'] as String,
  );
}

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'shop': instance.shop,
      'total_pay': instance.totalPay,
      'bonus_pay': instance.bonusPay,
      'pay_wo_bonus': instance.payWoBonus,
      'loyaltyProgId': instance.loyaltyProgId,
    };
