import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
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
                  child: Icon(CupertinoIcons.cube_box_fill, color: kTextColor,),
                ),
                Text(isSaleActivate ? 'Total de itens' : 'Itens selecionados'),
                Spacer(),
                Text('${Provider.of<ItemData>(context, listen: false).finishSaleList.length}', style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ),
          Divider(),
        ],
      );
  }
}
