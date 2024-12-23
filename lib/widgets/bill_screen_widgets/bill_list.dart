import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/bill_model.dart';
import 'package:mycommerce/widgets/bill_screen_widgets/bill_cell.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class BillList extends StatelessWidget {
  const BillList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection("bill@${Provider.of<ItemData>(context, listen: false).dbCommerceUID}").orderBy('dateTime', descending: true).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: Text('Não a registros de vendas'),
            );
          }
          final bills = snapshot.data?.docs;
          List<Bill> billsList = [];

          for(var bill in bills!){
            final dataTime = bill['dateTime'];
            final itemsSold = bill['itemsSold'];
            final total = bill['totalBill'];
            final billRecived = Bill(
                dateTime: DateTime.fromMillisecondsSinceEpoch(dataTime),
                itemsSold: Provider.of<ItemData>(context, listen: false).getBillListFromMap(itemsSold),
                totalBill: total
            );
            billsList.add(billRecived);
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                final bill = billsList[index];
                return BillCell(sale: bill);
              },
              itemCount: billsList.length,
            separatorBuilder: (context, index) {
                return Divider();
            },
          );
        }
    );
  }
}






// return Consumer<ItemData>(
// builder: (context, billData, child) {
// return ListView.separated(
// itemBuilder: (context, index) {
// final bill = billData.salesList[index];
// return BillCell(sale: bill);
// },
// separatorBuilder: (context, index) {
// return Divider();
// },
// itemCount: billData.salesList.length
// );
// }
// );

