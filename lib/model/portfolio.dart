import 'package:json_annotation/json_annotation.dart';

import 'purchase.dart';
import 'user.dart';
import 'loyalty_prog.dart';
part "portfolio.g.dart";

// flutter packages pub run build_runner build

@JsonSerializable()
class Portfolio {
  User user;
  @JsonKey(name: 'loyalty_prog')
  LoyaltyProg loyaltyProg;
  List<Purchase> purchases;

  Portfolio({this.user, this.loyaltyProg, List<Purchase> this.purchases});

  factory Portfolio.fromJson(Map<String, dynamic> json) => _$PortfolioFromJson(json);
  Map<String, dynamic> toJson() => _$PortfolioToJson(this);

  factory Portfolio.test() {
    LoyaltyProg lpTest = LoyaltyProg.test();
    return Portfolio(user: User.test(), loyaltyProg: lpTest, purchases: <Purchase>[
      Purchase.test(lpTest.id),
      Purchase.test(lpTest.id),
      Purchase.test(lpTest.id),
      Purchase.test(lpTest.id),
      Purchase.test(lpTest.id),
      Purchase.test(lpTest.id),
      Purchase.test(lpTest.id)
    ]);
  }
}
