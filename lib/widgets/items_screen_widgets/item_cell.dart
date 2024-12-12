import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/constants.dart';
import 'package:provider/provider.dart';
import 'package:mycommerce/controller/commerce_data.dart';

class ItemCell extends StatelessWidget {
  const ItemCell({
    super.key,
    required this.item,
  });

  final Item item;
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
              child: Provider.of<ItemData>(context, listen: false).saleIsEnable ? Icon(
                CupertinoIcons.archivebox,
                size: 35,
              ) : Icon(
                CupertinoIcons.archivebox_fill,
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
                CircleAvatar(child: Text('${item.stock}x')),
              ],
            ),
        ),
      ],
    );
  }
}
