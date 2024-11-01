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
        Row(
          children: [
            Text('${item.productName}'),
            Text('x${item.stock}'),
            Spacer(),
            Text('R\$${item.price}'),
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