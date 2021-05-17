import 'package:intl/intl.dart';

final DateFormat format = DateFormat("yyyyMMdd");

class User {
  String uid;
  String email;
  String name;
  String surname;
  String paronymic;
  String phoneNumber;
  String pwd;
  DateTime birthday;

  User({this.uid, this.email, this.name, this.surname, this.paronymic, this.phoneNumber, this.pwd, this.birthday});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        uid: map['uid'] as String,
        email: map['email'] as String,
        name: map['name'] as String,
        surname: map['surname'] as String,
        paronymic: map['paronymic'] as String,
        phoneNumber: map['phone_number'] as String,
        pwd: map['pwd'] as String,
        birthday: format.parse(map["birthday"])
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['uid'] = this.uid;
    map['email'] = this.email;
    map['name'] = this.name;
    map['pwd'] = this.pwd;

    if (this.birthday != null) {
      map['birthday'] = format.format(this.birthday);
    }

    if (this.surname != null) map['surname'] = this.surname;
    if (this.paronymic != null) map['paronymic'] = this.paronymic;
    if (this.phoneNumber != null) map['phone_number'] = this.phoneNumber;
    return map;
  }
}
