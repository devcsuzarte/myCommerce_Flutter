import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/widgets/items_list.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget> [
              CupertinoSliverNavigationBar(
                largeTitle: Text('Espaço Cell',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
                backgroundColor: kPrimaryColor,
              )
            ];
          },
          body: SafeArea(
            child: Container(
              child: ItemsList(),
            ),
          ),
        ),
    );
  }
}
