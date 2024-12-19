import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';
import 'package:mycommerce/constants.dart';

class Detaillist extends StatelessWidget {
  const Detaillist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, itemData, child){
          return ListView.separated(
              itemBuilder: (context, index) {
                final detail = itemData.detailList[index];
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(CupertinoIcons.arrow_down_right_square_fill),
                        ),
                        Text('${detail.property} : ${detail.description}'),
                      ],
                    ),
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.trash,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Provider.of<ItemData>(context, listen: false).removeDetail(index);
                          print('Remove detail pressed');
                        }),
                  ],
                );
              },
            separatorBuilder: (context, index) {
                return Divider();
            },
            itemCount: Provider.of<ItemData>(context, listen: false).detailList.length,
          );
        });
  }
}



