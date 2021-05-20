import 'package:json_annotation/json_annotation.dart';
part "loyalty_level.g.dart";

// flutter packages pub run build_runner build

enum Level {Beginner, Silver, Gold, Platinum}

extension ParseToString on Level {
  String toName() => this.toString().split('.').last;
}

@JsonSerializable()
class LoyaltyLevel {
  Level level;
  double payment;
  double bonuses;

  LoyaltyLevel({this.level, this.payment, this.bonuses});

  @override
  String toString() {
    return "${this.level.toName()}: pay >= $payment, bonus = $bonuses";
  }

  factory LoyaltyLevel.fromJson(Map<String, dynamic> json) => _$LoyaltyLevelFromJson(json);

  Map<String, dynamic> toJson() => _$LoyaltyLevelToJson(this);
}

