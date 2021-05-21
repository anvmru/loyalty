import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/purchase.dart';
import '../data/data_provider.dart';
import '../utils/const.dart';
import '../widget/mainappbar.dart';

class CabinetPage extends StatelessWidget {
  static const id = 'cabinet_page';
  final formatSum = NumberFormat("###.0#", "en_US");
  final DateFormat format = DateFormat("dd.MM");

  @override
  Widget build(BuildContext context) {
    final DataProvider _dp = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: mainAppBar(context, gLocale.bar_cabinet),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${gLocale.cabinet_lpname} ${_dp.lpName}",
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${gLocale.cabinet_remaining} ${formatSum.format(_dp.remainingBonuses)}",
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Text("${gLocale.cabinet_titlelist}", style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Divider(),
            PurchaseTitle(context),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _dp.purchases.length,
                itemBuilder: (BuildContext context, int index) => PurchaseRow(context, _dp.purchases[index])
                ),
            )
          ],
        ),
      ),
    );
  }

  Widget PurchaseTitle(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return ListTile(
      dense: true,
      leading: Text(gLocale.cabinet_t1, style: textStyle,),
      title: Text(gLocale.cabinet_t2, style: textStyle, textAlign: TextAlign.center,),
      trailing: Text(gLocale.cabinet_t3, style: textStyle),
    );
  }

  Widget PurchaseRow(BuildContext context, Purchase purchase) {
    return ListTile(
      leading: Text(format.format(purchase.date)),
      title: Text(purchase.shop),
      // Итого: 100.0, Бонусов: 8.0
      subtitle: Text(
          "${gLocale.purchase_amount} ${formatSum.format(purchase.totalPay)}\n${gLocale.purchase_payb} ${formatSum.format(purchase.bonusPay)} "),
      trailing: Text("${formatSum.format(purchase.payWoBonus)}"),
    );
  }
}
