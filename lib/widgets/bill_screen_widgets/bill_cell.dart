import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border.all(
            width: 2.2,
            color: kSecondaryColor,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 5),
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('${sale.dateTime.day}/${sale.dateTime.month}/${sale.dateTime.year} - ${sale.dateTime.hour}:${sale.dateTime.minute}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kSecondaryColor
                      ),
                    ),
                  ),
                  Icon(
                    Icons.monetization_on_sharp,
                    color: Colors.green,
                    size: 28,
                  ),
                ],
              ),
              ItemsSoldList(items: sale.itemsSold),
              Row(
                children: [
                  Spacer(),
                  Text('Total: R\$${sale.totalBill.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),
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
