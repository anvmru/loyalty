// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyLevel _$LoyaltyLevelFromJson(Map<String, dynamic> json) {
  return LoyaltyLevel(
    level: _$enumDecodeNullable(_$LevelEnumMap, json['level']),
    payment: (json['payment'] as num)?.toDouble(),
    bonuses: (json['bonuses'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LoyaltyLevelToJson(LoyaltyLevel instance) =>
    <String, dynamic>{
      'level': _$LevelEnumMap[instance.level],
      'payment': instance.payment,
      'bonuses': instance.bonuses,
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
