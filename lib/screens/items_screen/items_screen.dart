import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
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
                    print('oi');
                  },
                  child: Icon(
                    CupertinoIcons.cart_fill_badge_plus,
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


