import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/models/bill_model.dart';
import 'items_sold_list.dart';

class BillCell extends StatelessWidget {
  const BillCell({
    super.key,
    required this.sale,
  });

  final Bill sale;

  @override
  Widget build(BuildContext context) {
    //String formattedDate = DateFormat('dMy').format(sale.dateTime);
    String formattedDate = DateFormat("d 'de' MMM 'de' y", "pt_BR").format(sale.dateTime);
    String formattedTime = DateFormat.Hms().format(sale.dateTime);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('${formattedDate}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kTitleColor
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          color: kTextColor,
                          CupertinoIcons.clock_fill,
                          size: 15,
                        ),
                      ),
                      Text('${formattedTime}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: kTextColor
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ItemsSoldList(items: sale.itemsSold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: R\$ ${sale.totalBill.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: kTitleColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.monetization_on_sharp,
                    color: Colors.green,
                    size: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
