import 'package:json_annotation/json_annotation.dart';

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
}
