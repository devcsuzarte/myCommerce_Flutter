import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _screens = [
    Container(
      child: Text('Itens a venda'),
    ), Container(
      child: Text('Vender item'),
    ), Container(
      child: Text('Historico de vendas'),
    ),
  ];

  int _selectedScreen = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreen,
          onTap: (int index) {
            setState(() {
              _selectedScreen = index;
            });
          },
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
          ],
      ),
    );
  }
}
