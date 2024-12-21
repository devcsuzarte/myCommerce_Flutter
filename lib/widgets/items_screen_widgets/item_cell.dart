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
            minRadius: 28,
            child: Icon(
              item.stock! > 0 ? CupertinoIcons.archivebox_fill : CupertinoIcons.archivebox,
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
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
