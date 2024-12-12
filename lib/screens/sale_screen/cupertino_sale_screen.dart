import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/models/bill_model.dart';
import 'package:mycommerce/models/item_model.dart';
// import 'package:mycommerce/widgets/alert_dialog/cupertino_alert_dialog.dart';
// import 'package:mycommerce/widgets/alert_dialog/material_alert_dialog.dart';
import 'package:mycommerce/widgets/alert_dialog/showCustomAlertDialog.dart';
import 'package:mycommerce/widgets/confirm_sale_widget/item_sold_list.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_cell.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_list.dart';
import 'package:provider/provider.dart';
import '../../controller/commerce_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/sale_screen_widgets/sale_list_modal.dart';

final db = FirebaseFirestore.instance;

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    Provider.of<ItemData>(context, listen: true).cleanFinishSaleList();
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Seleção de Itens'),
        actions: [
          IconButton(
            onPressed: () {
             if(Provider.of<ItemData>(context, listen: false).finishSaleList.isEmpty){
               CustomAlertDialog(
                 alertActionTitle: kCartEmptyAlertDialogTitle,
                 alertDescription: kCartEmptyAlertDialogDescription,
                 alertTitle: kCartEmptyAlertActionTitle
               ).showCustomAlertDialog(context);
               //showCommerceCupertinoDialog(context);
             } else {
               showModalBottomSheet(
                   backgroundColor: Colors.white,
                   enableDrag: true,
                   showDragHandle: true,
                   context: context,
                   isScrollControlled: true,
                   builder: (context) => SaleListPopup()
               );
             }
            },
            icon: Icon(CupertinoIcons.cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SaleList(),
        ),
      ),
    );
  }
}

