import 'package:flutter/cupertino.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:provider/provider.dart';
import 'package:mycommerce/constants.dart';

class Detaillist extends StatelessWidget {
  const Detaillist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, itemData, child){
          return ListView.builder(
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
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: CupertinoTextFormFieldRow(
                        textInputAction: TextInputAction.next,
                        placeholder: detail.description,
                      ),
                    ),
                    Expanded(
                        child: CupertinoButton(
                            child: Icon(
                              CupertinoIcons.add_circled_solid,
                              color: kSecondaryColor,
                            ),
                            onPressed: () {
                              Provider.of<ItemData>(context, listen: false).removeDetail(index);
                              print('Add detail pressed');
                            })
                    ),
                  ],
                );
              },
            itemCount: Provider.of<ItemData>(context, listen: false).detailList.length,
          );
        });
  }
}



