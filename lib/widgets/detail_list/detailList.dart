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
                    Expanded(
                        child: CupertinoButton(
                            child: Icon(
                              CupertinoIcons.trash,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Provider.of<ItemData>(context, listen: false).removeDetail(index);
                              print('Remove detail pressed');
                            })
                    ),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: detail.propertyTextController,
                        decoration: kInputDecoration.copyWith(
                          labelText: 'Propriedade',
                          hintText: 'Ex: Cor'
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: detail.descriptionTextController,
                        decoration: kInputDecoration.copyWith(
                            labelText: 'Valor',
                            hintText: 'Ex: Preto'
                        ),
                      ),
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



