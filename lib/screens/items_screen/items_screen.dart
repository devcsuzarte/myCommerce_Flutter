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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'myCommerce',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: kSecondaryColor,
          foregroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              50),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right:  8.0, bottom: 10),
                child: TextField(
                  decoration: kSearchInputDecoration,
                ),
              ),
          ),
        ),
            body: SafeArea(
                child: Scaffold(
                  floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SaleScreen())
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


