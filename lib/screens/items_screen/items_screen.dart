import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/screens/sale_screen/cupertino_sale_screen.dart';
import 'package:mycommerce/widgets/items_screen_widgets/items_list.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';
import 'package:mycommerce/widgets/sale_screen_widgets/sale_list.dart';
import 'package:provider/provider.dart';

import '../../widgets/alert_dialog/showCustomAlertDialog.dart';
import '../../widgets/sale_screen_widgets/sale_list_modal.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('DEBUG ITEMSCREEN APPEARS');
    Provider.of<ItemData>(context, listen: false).getItemFromFirebase('');
  }
  @override

  Widget build(BuildContext context) {
    TextEditingController searchBarTextController = TextEditingController();
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'myCommerce',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
          backgroundColor: kSecondaryColor,
          foregroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              50),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right:  8.0, bottom: 10),
                child: TextField(
                  controller: searchBarTextController,
                  decoration: kSearchInputDecoration,
                  onChanged: (text) {
                    Provider.of<ItemData>(context, listen: false).getItemFromFirebase(text);
                  },
                ),
              ),
          ),
        ),
            body: SafeArea(
                child: Scaffold(
                  floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Provider.of<ItemData>(context, listen: false).toggleSaleState();
                     // Navigator.push(context, CupertinoPageRoute(builder: (context) => SaleScreen()));
                    },
                    child: Icon(
                      CupertinoIcons.money_dollar,
                      size: 32,
                      color: kSecondaryColor,),
                  ),
                  body: ItemsList()
                ),
              ),
            ),
    );
  }
}


