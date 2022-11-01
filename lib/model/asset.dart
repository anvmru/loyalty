import 'package:json_annotation/json_annotation.dart';

part "asset.g.dart";

// flutter packages pub run build_runner build

@JsonSerializable()
class Asset {
  int id;
  double rate;
  double rate_longer_5m;
  bool available;
  DateTime session_start_time;
  DateTime session_end_time;
  DateTime next_session_start_time;
  String symbol;
  String SessionSource;
  String RateSource;
  bool enabled;
  String category;
  bool deals_opening_allowed;
  String friendly_name;
  bool is_otc;
  String sparkline;

  Asset({
    this.id,
    this.rate,
    this.rate_longer_5m,
    this.available,
    this.session_start_time,
    this.session_end_time,
    this.next_session_start_time,
    this.symbol,
    this.SessionSource,
    this.RateSource,
    this.enabled,
    this.category,
    this.deals_opening_allowed,
    this.friendly_name,
    this.is_otc,
    this.sparkline
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}