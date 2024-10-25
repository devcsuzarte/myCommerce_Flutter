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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.money_dollar_circle_fill,
                size: 28,
              ),
              Text('${sale.dateTime.day}/${sale.dateTime.month}/${sale.dateTime.year} - ${sale.dateTime.hour}:${sale.dateTime.minute}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 8, ),
            child: ItemsSoldList(items: sale.itemsSold),
          ),
          Row(
            children: [
              Spacer(),
              Text('Total: R\$77.90',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
