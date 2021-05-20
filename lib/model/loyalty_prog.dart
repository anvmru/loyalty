import 'package:json_annotation/json_annotation.dart';

import '../utils/util.dart';
import 'loyalty_level.dart';

// flutter packages pub run build_runner build

part "loyalty_prog.g.dart";

@JsonSerializable()
class LoyaltyProg {
  String id;
  String name;
  String cardNo;
  double bonuses;
  List<LoyaltyLevel> levels;

  LoyaltyProg({this.id, this.name, this.cardNo, this.bonuses, List<LoyaltyLevel> this.levels});

  factory LoyaltyProg.fromJson(Map<String, dynamic> json) => _$LoyaltyProgFromJson(json);
  Map<String, dynamic> toJson() => _$LoyaltyProgToJson(this);

  // Тестовый набор данных
  factory LoyaltyProg.test() {
    return LoyaltyProg(
      id: Util.getId(),
      name: "В день защиты детей",
      cardNo: "0123-4567",
      bonuses: 9550.0,
      levels: <LoyaltyLevel>[
        LoyaltyLevel(level: Level.Beginner, payment: 100, bonuses: 10),
        LoyaltyLevel(level: Level.Silver, payment: 1000, bonuses: 20),
        LoyaltyLevel(level: Level.Gold, payment: 5000, bonuses: 100),
        LoyaltyLevel(level: Level.Platinum, payment: 10000, bonuses: 500)
      ]
    );
  }
}
