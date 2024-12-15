import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/commerce_data.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    super.key,
    required this.isSaleActivate,
    required this.counter,
  });

  final bool isSaleActivate;
  final int counter;

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 56,
                  child: Icon(isSaleActivate ? CupertinoIcons.archivebox_fill : CupertinoIcons.cube_box_fill),
                ),
                Text(isSaleActivate ? 'Total de itens' : 'Itens selecionados'),
                Spacer(),
                Text(isSaleActivate ? '${Provider.of<ItemData>(context, listen: false).itemsList.length}' : '${Provider.of<ItemData>(context, listen: false).finishSaleList.length}'),
              ],
            ),
          ),
          Divider(),
        ],
      );
  }
}
