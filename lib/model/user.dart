import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part "user.g.dart";

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

  User({this.email, this.firstName, this.lastName, this.middleName, this.phoneNumber, this.pwd, this.birthday});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.test() {
    return User(
      email: "dart@my.com",
      firstName: "Ivan",
      lastName: "Popov",
      middleName: "Petrovich",
      phoneNumber: "+7(913)102-1024",
      pwd: "psw",
      birthday: DateTime(1990, 4, 1)
    );
  }
}
