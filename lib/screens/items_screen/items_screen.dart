import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/widgets/items_screen_widgets/items_list.dart';
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
    super.initState();
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
          title: const Text(
            'myCommerce',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (Provider.of<ItemData>(context, listen: false)
                    .finishSaleList
                    .isEmpty) {
                  CustomAlertDialog(
                    alertTitle: kCartEmptyAlertDialogTitle,
                    alertDescription: kCartEmptyAlertDialogDescription,
                    alertActionTitle: kCartEmptyAlertActionTitle,
                  ).showCustomAlertDialog(context);
                  //showCommerceCupertinoDialog(context);
                } else {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      enableDrag: true,
                      showDragHandle: true,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => const SaleListPopup());
                }
              },
              icon: const Icon(CupertinoIcons.cube_box_fill),
            ),
            IconButton(
              onPressed: () {
                Provider.of<ItemData>(context, listen: false)
                    .cleanFinishSaleList();
              },
              icon: const Icon(CupertinoIcons.trash),
            ),
          ],
          backgroundColor: kSecondaryColor,
          foregroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 50),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
              child: TextField(
                controller: searchBarTextController,
                decoration: kSearchInputDecoration.copyWith(
                  suffix: InkWell(
                    onTap: () {
                      searchBarTextController.text = '';
                      FocusScope.of(context).unfocus();
                      Provider.of<ItemData>(context, listen: false)
                          .getItemFromFirebase('');
                    },
                    child: const Icon(CupertinoIcons.clear_circled),
                  ),
                ),
                onChanged: (text) {
                  Provider.of<ItemData>(context, listen: false)
                      .getItemFromFirebase(text);
                },
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: Scaffold(body: ItemsList()),
        ),
      ),
    );
  }
}
