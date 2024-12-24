import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/screens/add_item_screen/add_item_screen.dart';
import 'package:mycommerce/screens/items_screen/items_screen.dart';
import '../bills_screen/cupertino_bill_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    ItemsScreen(),
    AddItemScreen(),
    CupertinoBillScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: kSecondaryColor,
        onTap: _onTabTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
