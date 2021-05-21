import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part "user.g.dart";

// flutter packages pub run build_runner build

enum UserState { Undefine, Login, Logout }

final DateFormat format = DateFormat("yyyyMMdd");

@JsonSerializable()
class User {
  String email;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'middle_name')
  String middleName;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String pwd;
  DateTime birthday;
  UserState state;

  User({this.email, this.firstName, this.lastName, this.middleName, this.phoneNumber, this.pwd, this.birthday, this.state});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
