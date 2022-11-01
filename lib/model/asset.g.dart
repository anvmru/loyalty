// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return Asset(
    id: json['id'] as int,
    rate: (json['rate'] as num)?.toDouble(),
    rate_longer_5m: (json['rate_longer_5m'] as num)?.toDouble(),
    available: json['available'] as bool,
    session_start_time: json['session_start_time'] == null
        ? null
        : DateTime.parse(json['session_start_time'] as String),
    session_end_time: json['session_end_time'] == null
        ? null
        : DateTime.parse(json['session_end_time'] as String),
    next_session_start_time: json['next_session_start_time'] == null
        ? null
        : DateTime.parse(json['next_session_start_time'] as String),
    symbol: json['symbol'] as String,
    SessionSource: json['SessionSource'] as String,
    RateSource: json['RateSource'] as String,
    enabled: json['enabled'] as bool,
    category: json['category'] as String,
    deals_opening_allowed: json['deals_opening_allowed'] as bool,
    friendly_name: json['friendly_name'] as String,
    is_otc: json['is_otc'] as bool,
    sparkline: json['sparkline'] as String,
  );
}

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'rate_longer_5m': instance.rate_longer_5m,
      'available': instance.available,
      'session_start_time': instance.session_start_time?.toIso8601String(),
      'session_end_time': instance.session_end_time?.toIso8601String(),
      'next_session_start_time':
          instance.next_session_start_time?.toIso8601String(),
      'symbol': instance.symbol,
      'SessionSource': instance.SessionSource,
      'RateSource': instance.RateSource,
      'enabled': instance.enabled,
      'category': instance.category,
      'deals_opening_allowed': instance.deals_opening_allowed,
      'friendly_name': instance.friendly_name,
      'is_otc': instance.is_otc,
      'sparkline': instance.sparkline,
    };
