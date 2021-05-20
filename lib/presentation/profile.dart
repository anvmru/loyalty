import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../widget/mainappbar.dart';
import '../controller/profile.dart';
import '../utils/const.dart';

// View
class ProfilePage extends StatelessWidget {
  static const id = 'profile_page';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("* ProfilePage.build");
    final ProfileController _pc = Provider.of<ProfileController>(context);
    _pc.iniTec();

    return Scaffold(
      appBar: mainAppBar(context),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("${_pc.user.firstName} ${_pc.user.middleName} ${_pc.user.lastName}",
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("${gLocale.cabinet_lpname} ${_pc.lpName}", style: Theme.of(context).textTheme.headline6),
              ),
            ),

            // Логин
            ListTile(
                leading: const Icon(Icons.login),
                title: TextFormField(
                  readOnly: true,
                  controller: _pc.tecEmail,
                  decoration: new InputDecoration(hintText: gLocale.user_email),
                )),
            // Имя
            ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
                  controller: _pc.tecFirstName,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(hintText: gLocale.user_name),
                  validator: (value) => _pc.checkFirstName(value),
                )),
            // Отчество
            ListTile(
                leading: const Icon(Icons.people_alt_outlined),
                title: TextFormField(
                  controller: _pc.tecMiddleName,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(hintText: gLocale.user_paronymic),
                  validator: (value) => _pc.checkMiddleName(value),
                )),
            // Фамилия
            ListTile(
                leading: const Icon(Icons.people),
                title: TextFormField(
                  controller: _pc.tecLastName,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(hintText: gLocale.user_surname),
                  validator: (value) => _pc.checkLastName(value),
                )),
            // Телефон
            ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                  controller: _pc.tecPhone,
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(hintText: gLocale.user_phone),
                  validator: (value) => _pc.checkPhone(value),
                )),
            // Дата рождения
            ListTile(
                leading: const Icon(Icons.local_florist),
                title: TextFormField(
                  controller: _pc.tecBirthday,
                  keyboardType: TextInputType.datetime,
                  decoration: new InputDecoration(hintText: gLocale.user_birthday),
                  validator: (value) => _pc.checkBirthday(value),
                ),
                trailing:
                    IconButton(icon: Icon(Icons.date_range),
                        onPressed: () async => await _pc.selectDate(context)
                    )
            ),
          ])),

      floatingActionButton: !_pc.isEdit ? Container() :
      FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async => await _pc.save(context),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
