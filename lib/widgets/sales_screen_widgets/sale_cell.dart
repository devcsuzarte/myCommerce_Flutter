import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/models/sale_model.dart';
import 'package:mycommerce/controller/commerce_data.dart';

class SaleCell extends StatelessWidget {
  const SaleCell({
    super.key,
    required this.sale,
  });

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: CircleAvatar(
              minRadius: 28,
              child: Icon(
                CupertinoIcons.money_dollar,
                size: 35,
              ),
            ),
        ),
        Expanded(
            child: ListView(
              children: [
                Text('data'),
              ],
            ),
        ),
      ],
    );
  }
}
