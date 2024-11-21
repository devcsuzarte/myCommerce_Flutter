import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/detail_model.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/widgets/detail_list/detailList.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

final db = FirebaseFirestore.instance;

class CupertinoAddItemScreen extends StatefulWidget {
  const CupertinoAddItemScreen({
    super.key,
  });

  @override
  State<CupertinoAddItemScreen> createState() => _CupertinoAddItemScreenState();
}

class _CupertinoAddItemScreenState extends State<CupertinoAddItemScreen> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  int stock = 1;
  double price = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Produto"),
      ),
        body:  Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8.0),
                          child: Text('Preencha as informações'),
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Título do Produto',
                                  hintText: 'MACBOOK AIR M1'
                                ),
                                textInputAction: TextInputAction.next,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Insira um título válido';
                                  } else {
                                    title = value;
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Quantidade em estoque',
                                  hintText: '21',
                                ),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*';
                                  } else {
                                    stock = int.parse(value);
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                decoration: kInputDecoration.copyWith(
                                    labelText: 'Preço por unidade',
                                    hintText: '5200,00'
                                ),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*';
                                  } else {
                                    price = double.parse(value);
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Adicione propriedades do produto'),
                          IconButton(
                              icon: Icon(
                                CupertinoIcons.add_circled_solid,
                                color: kSecondaryColor,
                              ),
                              onPressed: () {
                                Provider.of<ItemData>(context, listen: false).addDetail();
                              }),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Detaillist(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          final form = formKey.currentState!;
                          if (form.validate()){
                            var newItem = Item(
                                productName: title,
                                details: Provider.of<ItemData>(context, listen: false).detailsString,
                                stock: stock,
                                price: price);
                            ItemData().registerItem(newItem);
                            print('Form is valid ${newItem.productName}');
                          }
                        },
                        child: Text('Cadastrar'),
                        ),
                  ),
                ],
              ),
            ),
    ) ;
  }
}

// children: [
// CupertinoFormSection.insetGrouped(
// margin: EdgeInsets.all(12),
// header: Text('Preencha as informações'),
// footer: Divider(),
// children: [
// CupertinoFormRow(
// prefix: Text('Título'),
// child: TextFormField(
// decoration: kInputDecoration,
// textInputAction: TextInputAction.next,
// autovalidateMode: AutovalidateMode.onUserInteraction,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Insira um título válido';
// } else {
// title = value;
// return null;
// }
// },
// ),
// ),
// CupertinoFormRow(
// prefix: Text('Estoque'),
// child: CupertinoTextFormFieldRow(
// keyboardType: TextInputType.number,
// placeholder: '10',
// textInputAction: TextInputAction.next,
// autovalidateMode: AutovalidateMode.onUserInteraction,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return '*';
// } else {
// stock = int.parse(value);
// return null;
// }
// },
// ),
// ),
// CupertinoFormRow(
// prefix: Text('Preço'),
// child: CupertinoTextFormFieldRow(
// keyboardType: TextInputType.numberWithOptions(decimal: true),
// placeholder: 'R\$ 5200,00',
// autovalidateMode: AutovalidateMode.onUserInteraction,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return '*';
// } else {
// price = double.parse(value);
// return null;
// }
// },
// ),
// ),
// ],
// ),
// CupertinoFormSection.insetGrouped(
// margin: EdgeInsets.all(12),
// header: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('Adicione propriedades do produto'),
// CupertinoButton(
// child: Icon(
// CupertinoIcons.add_circled_solid,
// color: kSecondaryColor,
// ),
// onPressed: () {
// Provider.of<ItemData>(context, listen: false).addDetail();
// }),
// ],
// ),
// children: [
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.25,
// child: Detaillist(),
// ),
// ],
// ),
// SizedBox(
// height: 20,
// ),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 12),
// width: double.infinity,
// child: CupertinoButton.filled(
// onPressed: () {
// final form = formKey.currentState!;
// if (form.validate()){
// var newItem = Item(
// productName: title,
// details: Provider.of<ItemData>(context, listen: false).detailsString,
// stock: stock,
// price: price);
// ItemData().registerItem(newItem);
// print('Form is valid ${newItem.productName}');
// }
// },
// child: Text('Cadastrar'),
// ),
// ),
// ],

