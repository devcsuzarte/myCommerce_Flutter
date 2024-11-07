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
                    Flexible(
                      flex: 3,
                      child: CupertinoTextFormFieldRow(
                        textInputAction: TextInputAction.next,
                        placeholder: detail.property,
                        controller: detail.propertyTextController,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: CupertinoTextFormFieldRow(
                        textInputAction: TextInputAction.next,
                        placeholder: detail.description,
                        controller: detail.descriptionTextController,
                      ),
                    ),
                    Expanded(
                        child: CupertinoButton(
                            child: Icon(
                              CupertinoIcons.minus_circle_fill,
                              color: kSecondaryColor,
                            ),
                            onPressed: () {
                              Provider.of<ItemData>(context, listen: false).removeDetail(index);
                              print('Remove detail pressed');
                            })
                    ),
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



