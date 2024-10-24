import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/items_screen_widgets/items_list.dart';
import '../../widgets/navigation_bar/appbar_cupertino.dart';
import 'package:mycommerce/widgets/sales_screen_widgets/sales_list.dart';

class CupertinoSaleScreen extends StatelessWidget {
  const CupertinoSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: AppbarCupertino(
          navBarTitle: 'Minhas vendas',
          body: SafeArea(
            child: Container(
              child: SalesList(),
            ),
          ),
        )
    );
  }
}
