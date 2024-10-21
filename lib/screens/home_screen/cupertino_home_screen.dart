import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/screens/add_item_screen/cupertino_add_item_screen.dart';
import 'package:mycommerce/screens/items_screen/items_screen.dart';
import '../sales_screen/cupertino_sale_screen.dart';

class CupertinoHomeScreen extends StatefulWidget {
  const CupertinoHomeScreen({super.key});

  @override
  State<CupertinoHomeScreen> createState() => _CupertinoHomeScreenState();
}

class _CupertinoHomeScreenState extends State<CupertinoHomeScreen> {

  final List<Widget> _screens = [
    ItemsScreen(),
    CupertinoAddItemScreen(),
    CupertinoSaleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: kSecondaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: "Home",
            ), BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rectangle_stack_badge_plus),
              label: "Cadastro",
            ), BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet_below_rectangle),
              label: "Histórico",
            ),
          ]
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _screens[index];
          },
        );
      },
    );
  }
}
