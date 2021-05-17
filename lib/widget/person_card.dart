import 'package:flutter/material.dart';
import '../presentation/registration.dart';
import '../utils/const.dart';

Widget PersonCard(RegController rc) {
  final TextEditingController tecName = TextEditingController();
  final TextEditingController tecSurname = TextEditingController();
  final TextEditingController tecPatronymic = TextEditingController();
  final TextEditingController tecPhone = TextEditingController();
  final TextEditingController tecBirthday = TextEditingController();

  return ListView(
    children: [
      // Имя
      ListTile(
          leading: const Icon(Icons.person),
          title: TextFormField(
            controller: tecName,
            decoration: new InputDecoration(hintText: gLocale.user_name),
            validator: (value) => rc.checkNotEmpty(value),
          )),
      // Фамилия
      ListTile(
          leading: const Icon(Icons.people),
          title: TextFormField(
            controller: tecSurname,
            decoration: new InputDecoration(hintText: gLocale.user_surname),
            validator: (value) => rc.checkNotEmpty(value),
          )),
      // Отчество
      ListTile(
          leading: const Icon(Icons.people_alt_outlined),
          title: TextFormField(
            controller: tecPatronymic,
            decoration: new InputDecoration(hintText: gLocale.user_paronymic),
            validator: (value) => rc.checkNotEmpty(value),
          )),
      // Телефон
      ListTile(
          leading: const Icon(Icons.phone),
          title: TextFormField(
            controller: tecPhone,
            decoration: new InputDecoration(hintText: gLocale.user_phone),
            validator: (value) => rc.checkNotEmpty(value),
          )),
      // Дата рождения
      ListTile(
          leading: const Icon(Icons.local_florist),
          title: TextFormField(
            controller: tecBirthday,
            decoration: new InputDecoration(hintText: gLocale.user_phone),
            validator: (value) => rc.checkNotEmpty(value),
          )),
    ],
  );
}