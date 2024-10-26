import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/models/bill_model.dart';

class ItemsSoldList extends StatelessWidget {
  const ItemsSoldList({
    super.key,
    required this.items,
  });

  final List<ItemSold> items;

  List<Widget> getItemSold() {
    List<Widget> soldList = [];
    for (ItemSold item in items) {
      soldList.add(
        Row(
          children: [
            Text('${item.title}'),
            Text('x${item.amount}'),
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