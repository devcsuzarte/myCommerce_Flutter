import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';
import '../../models/item_model.dart';


class ItemCell extends StatelessWidget {
  const ItemCell({
    super.key,
    required this.item,
    required this.index,
  });

  final Item item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final itemData = ItemData();
    itemData.getDetailsToItemCell(item.details!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 2,
          child: CircleAvatar(
            backgroundColor: kSecondaryColor,
            minRadius: 38,
            backgroundImage: NetworkImage('https://i.guim.co.uk/img/media/18badfc0b64b09f917fd14bbe47d73fd92feeb27/189_335_5080_3048/master/5080.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=1562112c7a64da36ae0a5e75075a0d12')
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
              Text('R\$ ${item.price?.toStringAsFixed(2)}',
                style: kBoldMediumTextStyle,
              ),
              Text('Estoque: ${item.stock}x',
                style: kNormalTextStyle,
              ),
              Text('${itemData.getDetailsToItemCell(item.details!)}',
                style: kNormalTextStyle,
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<ItemData>(context, listen: false).checkBoxPressed(index);
                },
                icon: Icon(
                  CupertinoIcons.plus_circle_fill,
                  color: kTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
