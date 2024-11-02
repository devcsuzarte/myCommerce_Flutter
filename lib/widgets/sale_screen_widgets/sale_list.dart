import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_cell.dart';
import 'package:provider/provider.dart';

class SaleList extends StatelessWidget {
  const SaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>
      (builder: (context, itemData, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
          final item = itemData.itemsList[index];
            return SaleCell(
              item: item,
              index: index,
              );},
      separatorBuilder: (context, index) {
      return Padding(
      padding: const EdgeInsets.only(left: 22.0),
      child: Divider(),
      );
      },
      itemCount: itemData.itemsList.length,
      );
    });
  }
}