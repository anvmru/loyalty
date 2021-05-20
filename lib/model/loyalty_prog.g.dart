// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_prog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyProg _$LoyaltyProgFromJson(Map<String, dynamic> json) {
  return LoyaltyProg(
    id: json['id'] as String,
    name: json['name'] as String,
    cardNo: json['cardNo'] as String,
    bonuses: (json['bonuses'] as num)?.toDouble(),
    levels: (json['levels'] as List)
        ?.map((e) =>
            e == null ? null : LoyaltyLevel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoyaltyProgToJson(LoyaltyProg instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cardNo': instance.cardNo,
      'bonuses': instance.bonuses,
      'levels': instance.levels,
    };
