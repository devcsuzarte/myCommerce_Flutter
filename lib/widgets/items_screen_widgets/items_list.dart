import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';
import 'item_cell.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
      builder: (context, itemData, child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final item = itemData.itemsList[index];
              return Container(
                child: ItemCell(
                  item: item,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: itemData.itemsList.length,
        );
      }

    );
  }
}
