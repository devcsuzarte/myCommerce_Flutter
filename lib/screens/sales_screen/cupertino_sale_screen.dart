import 'package:flutter/cupertino.dart';
import '../../widgets/items_list.dart';
import '../../widgets/navigation_bar/appbar_cupertino.dart';

class CupertinoSaleScreen extends StatelessWidget {
  const CupertinoSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: AppbarCupertino(
          navBarTitle: 'Minhas vendas',
          body: SafeArea(
            child: Container(
              child: ItemsList(),
            ),
          ),
        )
    );;
  }
}
