import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import '../../widgets/items_screen_widgets/items_list.dart';
import '../../widgets/navigation_bar/appbar_cupertino.dart';
import 'package:mycommerce/widgets/bill_screen_widgets/bill_list.dart';

class CupertinoBillScreen extends StatelessWidget {
  const CupertinoBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text('Minhas vendas'),
      ),
      body: SafeArea(
        child: Container(
          child: BillList(),
        ),
      ),
    );
  }
}
