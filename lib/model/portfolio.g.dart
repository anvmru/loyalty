// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) {
  return Portfolio(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    loyaltyProg: json['loyalty_prog'] == null
        ? null
        : LoyaltyProg.fromJson(json['loyalty_prog'] as Map<String, dynamic>),
    purchases: (json['purchases'] as List)
        ?.map((e) =>
            e == null ? null : Purchase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PortfolioToJson(Portfolio instance) => <String, dynamic>{
      'user': instance.user,
      'loyalty_prog': instance.loyaltyProg,
      'purchases': instance.purchases,
    };
