import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/widgets/sales_screen_widgets/sale_cell.dart';
import 'package:provider/provider.dart';

class SalesList extends StatelessWidget {
  const SalesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, salesData, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final sale = salesData.salesList[index];
                return SaleCell(sale: sale);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: salesData.salesList.length
          );
        }
    );
  }
}

