import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/purchase.dart';
import '../providers/data_provider.dart';
import '../utils/const.dart';

class CabinetPage extends StatelessWidget {
  static const id = 'cabinet_page';
  final formatSum = NumberFormat("###.0#", "en_US");
  final DateFormat format = DateFormat("dd.MM");

  @override
  Widget build(BuildContext context) {
    final DataProvider _dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(gLocale.bar_cabinet),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: Text("${gLocale.cabinet_lpname} ${_dataProvider.lpName}",
                    style: Theme.of(context).textTheme.headline6)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("${gLocale.cabinet_remaining} ${formatSum.format(_dataProvider.remainingBonuses)}",
                style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(child: Text("${gLocale.cabinet_titlelist}", style: Theme.of(context).textTheme.headline6)),
          ),
          Divider(),
          //PurchaseList(_dataProvider)
          StreamBuilder<Purchase>(
              stream: _dataProvider.fetchPurchase(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("* Error: ${snapshot.error}");
                } else if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  //return ListView.builder(itemBuilder: (BuildContext context, int index) {
                  return PurchaseRow(context, snapshot.data);
                  //});
                }
              })
        ],
      ),
    );
  }

  Widget PurchaseList(DataProvider dp) {
    return StreamBuilder<Purchase>(
        stream: dp.fetchPurchase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("* Error: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(itemBuilder: (BuildContext context, int index) {
              return PurchaseRow(context, snapshot.data);
            });
          }
        });
  }

  Widget PurchaseRow(BuildContext context, Purchase purchase) {
    return ListTile(
      leading: Text(format.format(purchase.date)),
      title: Text(purchase.shop),
      // Итого: 100.0, Бонусов: 8.0
      subtitle: Text(
          "${gLocale.purchase_amount} ${formatSum.format(purchase.totalPay)}, ${gLocale.purchase_payb} ${formatSum.format(purchase.bonusPay)} "),
      trailing: Text("${formatSum.format(purchase.payWoBonus)}"),
    );
  }
}
