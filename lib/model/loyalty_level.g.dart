// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyalityLevel _$LoyalityLevelFromJson(Map<String, dynamic> json) {
  return LoyalityLevel(
    level: _$enumDecodeNullable(_$LevelEnumMap, json['level']),
    minPay: (json['min_pay'] as num)?.toDouble(),
    bonusAmount: (json['bonus_amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LoyalityLevelToJson(LoyalityLevel instance) =>
    <String, dynamic>{
      'level': _$LevelEnumMap[instance.level],
      'min_pay': instance.minPay,
      'bonus_amount': instance.bonusAmount,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$LevelEnumMap = {
  Level.Beginner: 'Beginner',
  Level.Silver: 'Silver',
  Level.Gold: 'Gold',
  Level.Platinum: 'Platinum',
};
