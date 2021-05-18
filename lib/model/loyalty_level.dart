import 'package:json_annotation/json_annotation.dart';
part "loyalty_level.g.dart";

enum Level {Beginner, Silver, Gold, Platinum}

extension ParseToString on Level {
  String toName() => this.toString().split('.').last;
}

@JsonSerializable()
class LoyalityLevel {
  Level level;

  @JsonKey(name: 'min_pay')
  double minPay;

  @JsonKey(name: 'bonus_amount')
  double bonusAmount;

  LoyalityLevel({this.level, this.minPay, this.bonusAmount});

  @override
  String toString() {
    return "${this.level.toName()}: pay >= $minPay, bonus = $bonusAmount";
  }

  factory LoyalityLevel.fromJson(Map<String, dynamic> json) => _$LoyalityLevelFromJson(json);

  Map<String, dynamic> toJson() => _$LoyalityLevelToJson(this);
}

