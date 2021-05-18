import 'package:json_annotation/json_annotation.dart';

import '../utils/util.dart';
import 'loyalty_level.dart';

part "loyalty_prog.g.dart";

@JsonSerializable()
class LoyaltyProg {
  String id;
  String name;
  String cardNo;
  double bonuses;
  List<LoyalityLevel> levels;

  LoyaltyProg({this.id, this.name, this.cardNo, this.bonuses, List<LoyalityLevel> levels});

  factory LoyaltyProg.fromJson(Map<String, dynamic> json) => _$LoyaltyProgFromJson(json);
  Map<String, dynamic> toJson() => _$LoyaltyProgToJson(this);

  factory LoyaltyProg.test() {
    return LoyaltyProg(
      id: Util.getId(),
      name: "Для программистов",
      cardNo: "0123-4567",
      bonuses: 6500.0,
      levels: <LoyalityLevel>[
        LoyalityLevel(level: Level.Beginner, minPay: 100, bonusAmount: 10),
        LoyalityLevel(level: Level.Silver, minPay: 1000, bonusAmount: 20),
        LoyalityLevel(level: Level.Gold, minPay: 5000, bonusAmount: 100),
        LoyalityLevel(level: Level.Platinum, minPay: 10000, bonusAmount: 500)
      ]
    );
  }
}
