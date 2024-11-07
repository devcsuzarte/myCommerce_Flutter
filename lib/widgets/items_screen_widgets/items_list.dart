import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:provider/provider.dart';
import 'item_cell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection("items").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No data'),
            );
          }
          final items = snapshot.data?.docs;
          final List<Item> itemList = [];
          for(var item in items!) {
            final productName = item['productName'];
            final price = item['price'];
            final stock = item['stock'];
            final details = item['details'];
            final id = item.id;

            final itemRecived = Item(
              productName: productName,
              price: price,
              stock: stock,
              details: details,
              id: id,
            );
            itemList.add(itemRecived);
          }
          Provider.of<ItemData>(context, listen: false).itemsList = itemList;
          return ListView.separated(
            itemBuilder: (context, index) {
              final item = itemList[index];
              return Container(
                child: ItemCell(
                  item: item,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: itemList.length,
          );
        }
    );
  }
}