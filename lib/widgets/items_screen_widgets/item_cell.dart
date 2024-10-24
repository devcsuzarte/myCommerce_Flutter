import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/constants.dart';

class ItemCell extends StatelessWidget {
  const ItemCell({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 2,
            child: CircleAvatar(
              minRadius: 28,
              child: Icon(
                CupertinoIcons.archivebox,
                size: 35,
              ),
            ),
        ),
        Expanded(
          flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.productName}',
                  style: kBoldTextStyle
                ),
                Text('${item.details}'),
              ],
            ),
        ),
        Flexible(
          flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('R\$ ${item.price}',
                  style: kBoldMediumTextStyle,
                ),
                Text('${item.stock}x'),
              ],
            ),
        ),
      ],
    );
  }
}
