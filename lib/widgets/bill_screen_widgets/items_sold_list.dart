import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/models/bill_model.dart';

import '../../models/item_model.dart';

class ItemsSoldList extends StatelessWidget {
  const ItemsSoldList({
    super.key,
    required this.items,
  });

  final List<Item> items;

  List<Widget> getItemSold() {
    List<Widget> soldList = [];
    for (Item item in items) {
      soldList.add(
        Column(
          children: [
            Row(
              children: [
                Text('x${item.amount} '),
                Text('${item.productName}'),
                Spacer(),
                Text('${item.price?.toStringAsFixed(2)} R\$'),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: kSecondaryColor,
            )
          ],
        )
      );
    }

    return soldList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getItemSold(),
    );

  }
}