import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/screens/items_screen.dart';

class CupertinoHomeScreen extends StatefulWidget {
  const CupertinoHomeScreen({super.key});

  @override
  State<CupertinoHomeScreen> createState() => _CupertinoHomeScreenState();
}

class _CupertinoHomeScreenState extends State<CupertinoHomeScreen> {

  final List<Widget> _screens = [
    ItemsScreen(),
    Container(
      child: Text('Vender item'),
    ), Container(
      child: Text('Historico de vendas'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: kSecondaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ), BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: "Venda",
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
