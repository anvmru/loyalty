import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/presentation/loyalty_prog.dart';
//import 'package:provider/provider.dart';

import '../widget/qr_code.dart';
//import '../providers/data_provider.dart';
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
  //DataProvider _dataProvider;
  final PageController _pageController = PageController();
  int _page;

  @override
  void initState() {
    super.initState();
    _page = 0;
  }

  // @override
  // void didChangeDependencies() {
  //   _dataProvider = Provider.of<DataProvider>(context);
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    print("* MainPage.build");
    return Scaffold(
      body: PageView(
        children: <Widget>[
          CabinetPage(),
          ProfilePage(),
          LoyaltiProgPage(),
        ],
        controller: _pageController,
        onPageChanged: (page) => setState(() => _page = page),
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).backgroundColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: gLocale.bar_cabinet),
                BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: gLocale.bar_profile),
              ],
              onTap: (page) => _pageController.jumpToPage(page),
              currentIndex: _page,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),// Text(gLocale.fab_qr),
        onPressed: () {
          showDialog<bool>(
              context: context,
              builder: (BuildContext context) => QrCode()
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();

    super.dispose();
  }
}
