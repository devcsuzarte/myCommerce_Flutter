import 'package:flutter/cupertino.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';

import '../../models/item_model.dart';

class SaleCell extends StatelessWidget {
  const SaleCell({
    super.key,
    required this.item,
    required this.index,
  });

  final Item item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${item.productName}', style: kBoldMediumTextStyle,),
          Text('Preço: R\$${item.price}'),
          Text('Estoque: ${item.stock}'),
          Text('Detalhes: ${ItemData().getDetailsToItemCell(item.details!)}', maxLines: 3,),
        ],
      ),
      trailing: CupertinoCheckbox(
          value: Provider.of<ItemData>(context).itemsList[index].isSelected,
          onChanged: (value) => Provider.of<ItemData>(context, listen: false).checkBoxPressed(index),
      ),
    );
  }
}
