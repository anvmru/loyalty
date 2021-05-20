import 'package:flutter/material.dart';
import 'package:loyalty/model/loyalty_level.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';
import '../utils/const.dart';

class LoyaltiProgPage extends StatelessWidget {
  static const id = 'loyalti_prog_page';

  @override
  Widget build(BuildContext context) {
    final DataProvider _dp = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(gLocale.bar_lp), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${gLocale.cabinet_lpname} ${_dp.lpName}", style: Theme.of(context).textTheme.headline6),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${gLocale.lp_desc_level}", style: Theme.of(context).textTheme.headline6),
            ),
          ),
          Divider(),
          _levelsTitle(context),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _dp.levels.length,
              itemBuilder: (context, index) => _levelsRow(context, _dp.levels[index])
            ),
          ),
          Divider(),
        ]),
      ),
    );
  }

  Widget _levelsTitle(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return ListTile(
      dense: true,
      leading: SizedBox(child: Text(gLocale.lp_t1, style: textStyle,), width: MediaQuery.of(context).size.width * 0.2,),
      title: Text(gLocale.lp_t2, style: textStyle, textAlign: TextAlign.start,),
      trailing: Text(gLocale.lp_t3, style: textStyle, textAlign: TextAlign.end,),
    );
  }

  Widget _levelsRow(BuildContext context, LoyaltyLevel ll) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return ListTile(
      dense: true,
      leading: SizedBox(child: Text(ll.level.toName(), style: textStyle), width: MediaQuery.of(context).size.width * 0.2,),
      title: Text(ll.payment.toString(), style: textStyle),
      trailing: Text(ll.bonuses.toString(), style: textStyle),
    );
  }
}
