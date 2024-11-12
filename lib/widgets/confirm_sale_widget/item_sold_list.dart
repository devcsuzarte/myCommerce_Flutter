import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';

class ItemSoldList extends StatelessWidget {
  const ItemSoldList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, itemData, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final item = itemData.finishSaleList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.productName}'),
                    SizedBox(
                      height: 50,
                      width: 50,
                        child: CupertinoTextField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(

                          ),
                          onChanged: (amount){
                            Provider.of<ItemData>(context, listen: false).amountSoldChanged(index, int.parse(amount));
                            print("AMOUNT: $amount");
                          },
                        ),
                    )
                  ],
                );
          },
          separatorBuilder: (context, index) {
                return Divider();
              },
          itemCount: Provider.of<ItemData>(context, listen: true).finishSaleList.length,
          );
        },
        );
  }
}
