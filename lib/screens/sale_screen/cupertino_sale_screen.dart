import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/widgets/confirm_sale_widget/item_sold_list.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_cell.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_list.dart';

class CupertinoSaleScreen extends StatelessWidget {
  const CupertinoSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Seleção de Itens'),
        trailing: IconButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (context) => Column(
                  children: [
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Resumo da venda',
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: ItemSoldList(),
                            ),
                            Expanded(
                              flex: 1,
                              child: CupertinoButton(
                                color: CupertinoColors.systemGrey5,
                                child: Text(
                                  'Finalizar venda',
                                  style: TextStyle(
                                    color: CupertinoColors.activeBlue,
                                  ),
                                ),
                                onPressed: () {
                                  print('End sale');
                                  Navigator.pop(context);
                                },
                                ),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            );
          },
          icon: Icon(CupertinoIcons.cart),),
      ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SaleList(),
            ),
        ),
    );
  }
}