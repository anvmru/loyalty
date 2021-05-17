import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/qr_code.dart';
import '../providers/user_provider.dart';
import '../presentation/cabinet.dart';
import '../presentation/profile.dart';
import '../utils/const.dart';

class MainPage extends StatefulWidget {
  static const id = 'main_page';
  MainPage();

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  UserProvider _userProvider;
  final PageController _pageController = PageController();
  int _page;

  @override
  void initState() {
    super.initState();
    _page = 0;
  }

  @override
  void didChangeDependencies() {
    _userProvider = Provider.of<UserProvider>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          CabinetPage(),
          ProfilePage(),
        ],
        controller: _pageController,
        onPageChanged: (page) => setState(() => _page = page),
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: BottomNavigationBar(
              selectedItemColor: Theme.of(context).indicatorColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: gLocale.bar_cabinet),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: gLocale.bar_profile),
              ],
              onTap: (page) => _pageController.jumpToPage(page),
              currentIndex: _page,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Text(gLocale.fab_qr),
        onPressed: () => Navigator.of(context).pushNamed(QrCode.id),
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();

    super.dispose();
  }
}
