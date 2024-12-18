import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/detail_model.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/widgets/add_item_widgets/add_detail.dart';
import 'package:mycommerce/widgets/detail_list/detailList.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

final db = FirebaseFirestore.instance;

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({
    super.key,
  });

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  int stock = 1;
  double price = 0.0;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de Produto"),
        ),
          body:  Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Preencha as informações',
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: TextFormField(
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: TextFormField(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                'Propriedades do produto',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                        AddDetail(),
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
                        style: TextButton.styleFrom(
                          foregroundColor: kSecondaryColor,
                          backgroundColor: kPrimaryColor,
                        ),
                          onPressed: () {
                            final form = formKey.currentState!;
                            if (form.validate()){
                              var newItem = Item(
                                  productName: title.toUpperCase(),
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

