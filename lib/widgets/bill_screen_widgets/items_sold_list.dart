import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                Text('R\$${item.price?.toStringAsFixed(2)}'),
              ],
            ),
            Divider()
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

// return ListView.builder(
//     itemCount: item.length,
//     itemBuilder: (BuildContext context, int index) {
//       return Text(
//         '${item[index].amount}'
//       );
//     }
//     );