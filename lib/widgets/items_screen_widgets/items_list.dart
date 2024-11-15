import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:provider/provider.dart';
import 'item_cell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycommerce/constants.dart';

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
              final TextEditingController priceTextController = TextEditingController();
              final TextEditingController stockTextController = TextEditingController();
              priceTextController.text = item.price.toString();
              stockTextController.text = item.stock.toString();
              return CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => Column(
                        children:[
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Text(item.productName!,
                                            style: TextStyle(
                                                color: kSecondaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21,
                                            ),
                                          ),
                                        ),
                                        CupertinoButton(
                                            child: Icon(
                                              CupertinoIcons.trash_fill,
                                              color: Colors.red,
                                            ),
                                            onPressed:() {
                                              Provider.of<ItemData>(context, listen: false).deleteItem(item.id!);
                                              Navigator.pop(context);
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Preço:'),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: CupertinoTextField(
                                              controller: priceTextController,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Estoque:"),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: CupertinoTextField(
                                              controller: stockTextController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CupertinoButton(
                                    color: kPrimaryColor,
                                    child: Text(
                                      'Confirmar alteração',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    onPressed: () {
                                      Provider.of<ItemData>(context, listen: false).updateItem(
                                          item.id!,
                                          int.parse(stockTextController.text),
                                          double.parse(priceTextController.text)
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                        ), 
                          Spacer()
                        ]
                      ),
                  );
                  print("ID: ${item.id}");
                },
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