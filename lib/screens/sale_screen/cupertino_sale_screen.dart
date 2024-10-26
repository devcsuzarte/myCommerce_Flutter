import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    Text('data'),
                    Text('data'),
                    Text('data'),
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
