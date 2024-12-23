import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../controller/commerce_data.dart';
import '../confirm_sale_widget/item_sold_list.dart';

class SaleListPopup extends StatelessWidget {
  const SaleListPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.65,
        child: Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                    bool wasSale = Provider.of<ItemData>(context, listen: false).registerSale(Provider.of<ItemData>(context, listen: false).dbCommerceUID);
                    final snackBar = SnackBar(
                      content: Text(
                        wasSale ? 'Venda efetuada com sucesso' : 'Erro ao efetuar venda, quantidade excede o estoque',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      showCloseIcon: true,
                      backgroundColor: wasSale? Colors.green : Colors.red,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}