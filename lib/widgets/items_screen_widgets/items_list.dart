import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/widgets/items_screen_widgets/item_counter.dart';
import 'package:provider/provider.dart';
import '../sale_screen_widgets/sale_cell.dart';
import '../sale_screen_widgets/sale_list.dart';
import 'item_cell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycommerce/constants.dart';

final db = FirebaseFirestore.instance;

class ItemsList extends StatefulWidget {
   const ItemsList({
     super.key,
  });

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, productData, child){
          return Column(
            children: [
              ItemCounter(isSaleActivate: Provider.of<ItemData>(context, listen: false).saleIsEnable, counter: Provider.of<ItemData>(context, listen: false).itemsList.length),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = Provider.of<ItemData>(context, listen: false).itemsList[index];
                    final TextEditingController priceTextController = TextEditingController();
                    final TextEditingController stockTextController = TextEditingController();
                    priceTextController.text = item.price.toString();
                    stockTextController.text = item.stock.toString();
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            enableDrag: true,
                            showDragHandle: true,
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.7,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 7,
                                                    child: Text(item.productName!,
                                                      style: TextStyle(
                                                          color: kSecondaryColor,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 21,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: MaterialButton(
                                                        child: Icon(
                                                          CupertinoIcons.trash_fill,
                                                          color: Colors.red,
                                                        ),
                                                        onPressed:() {
                                                          Provider.of<ItemData>(context, listen: false).deleteItem(item.id!);
                                                          Navigator.pop(context);
                                                        }),
                                                  ),
                                                  Expanded(
                                                    child: MaterialButton(
                                                        child: Icon(
                                                          CupertinoIcons.check_mark,
                                                          color: Colors.green,
                                                        ),
                                                        onPressed:() {
                                                          Provider.of<ItemData>(context, listen: false).updateItem(
                                                              item.id!,
                                                              int.parse(stockTextController.text),
                                                              double.parse(priceTextController.text),
                                                          );
                                                          Navigator.pop(context);
                                                        }),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: TextField(
                                                controller: priceTextController,
                                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                decoration: kInputDecoration.copyWith(
                                                  labelText: 'Preço'
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: TextField(
                                                controller: stockTextController,
                                                decoration: kInputDecoration.copyWith(
                                                    labelText: 'Estoque'
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.5
                                      )
                                    ],
                                  ),
                                ),
                                                       ),
                            ),
                        );
                        print("ID: ${item.id}");
                      },
                      child: ItemCell(
                        item: item,
                        index: index,
                      )
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: Provider.of<ItemData>(context, listen: false).itemsList.length,
                ),
              ),
            ],
          );
        }
    );
  }
}