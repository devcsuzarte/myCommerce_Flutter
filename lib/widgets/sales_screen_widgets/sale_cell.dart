import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/models/sale_model.dart';
import 'items_sold_list.dart';

class SaleCell extends StatelessWidget {
  const SaleCell({
    super.key,
    required this.sale,
  });

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.money_dollar_circle_fill),
            Text('${sale.dateTime}'),
          ],
        ),
        ItemsSoldList(items: sale.itemsSold),
        Text('Total: 77,90'),
      ],
    );
  }
}
