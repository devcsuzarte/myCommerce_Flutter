import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/widgets/bill_screen_widgets/bill_cell.dart';
import 'package:provider/provider.dart';

class BillList extends StatelessWidget {
  const BillList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
        builder: (context, billData, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final bill = billData.salesList[index];
                return BillCell(sale: bill);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: billData.salesList.length
          );
        }
    );
  }
}

