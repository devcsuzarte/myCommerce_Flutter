import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';

class ItemSoldList extends StatelessWidget {
  const ItemSoldList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, itemData, child) {
          return ListView.builder(
              itemBuilder: (context, index) {
                final item = itemData.finishSaleList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Provider.of<ItemData>(context, listen: false).removeItemFromFinishSale(index);
                              },
                              icon: Icon(CupertinoIcons.clear_circled_solid)
                          ),
                          Text('${item.productName}',
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 50,
                            width: 50,
                              child: TextField(
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1',
                                ),
                                onChanged: (amount){
                                  Provider.of<ItemData>(context, listen: false).amountSoldChanged(index, int.parse(amount));
                                  print("AMOUNT: $amount");
                                },
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
          },
          itemCount: Provider.of<ItemData>(context, listen: true).finishSaleList.length,
          );
        },
        );
  }
}

class ItemSoldCell extends StatelessWidget {
  const ItemSoldCell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
