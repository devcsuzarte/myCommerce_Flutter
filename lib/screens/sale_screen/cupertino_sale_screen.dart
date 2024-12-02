import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/models/bill_model.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/widgets/confirm_sale_widget/item_sold_list.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_cell.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_list.dart';
import 'package:provider/provider.dart';
import '../../controller/commerce_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      appBar: AppBar(
        title: Text('Seleção de Itens'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  enableDrag: true,
                  showDragHandle: true,
                  context: context,
                  builder: (context) => SaleListPopup());
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

class SaleListPopup extends StatelessWidget {
  const SaleListPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ItemSoldList(),
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: kSecondaryColor,
              child: Text(
                'Concluir',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 25,
                ),
              ),
              onPressed: () {
                Provider.of<ItemData>(context, listen: false).registerSale();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

