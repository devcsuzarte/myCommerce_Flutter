import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/screens/sale_screen/cupertino_sale_screen.dart';
import 'package:mycommerce/widgets/items_screen_widgets/items_list.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: AppbarCupertino(
          navBarTitle: 'Juninho PCs',
          body: SafeArea(
              child: Scaffold(
                floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => CupertinoSaleScreen())
                    );
                  },
                  child: Icon(
                    CupertinoIcons.money_dollar,
                    size: 32,
                    color: kSecondaryColor,),
                ),
                body: ItemsList(),
              ),
            ),
          ),
    );
  }
}


