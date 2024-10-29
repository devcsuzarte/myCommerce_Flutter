import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: AppbarCupertino(
          navBarTitle: 'Cadastro de Produto',
            body: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CupertinoFormSection.insetGrouped(
                    margin: EdgeInsets.all(12),
                    header: Text('Preencha as informações'),
                    footer: Divider(),
                      children: [
                        CupertinoFormRow(
                          prefix: Text('Título'),
                          child: CupertinoTextFormFieldRow(
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
                            placeholder: 'MAC BOOK AIR M1 256GB',
                          ),
                        ),
                        CupertinoFormRow(
                          prefix: Text('Estoque'),
                          child: CupertinoTextFormFieldRow(
                            keyboardType: TextInputType.number,
                            placeholder: '10',
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        CupertinoFormRow(
                          prefix: Text('Preço'),
                          child: CupertinoTextFormFieldRow(
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            placeholder: 'R\$ 5200,00',
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                  ),
                  CupertinoFormSection.insetGrouped(
                    margin: EdgeInsets.all(12),
                    header: Text('Adicione propriedades do produto'),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: CupertinoTextFormFieldRow(
                                textInputAction: TextInputAction.next,
                                placeholder: 'Propriedade',
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: CupertinoTextFormFieldRow(
                                textInputAction: TextInputAction.next,
                                placeholder: 'Descrição',
                              ),
                            ),
                            Expanded(
                                child: CupertinoButton(
                                    child: Icon(
                                      CupertinoIcons.add_circled_solid,
                                      color: kSecondaryColor,
                                    ),
                                    onPressed: () {
                                      print('Add detail pressed');
                                    })
                            ),
                          ],
                        ),
                      ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    child: CupertinoButton.filled(
                        onPressed: () {
                          final form = formKey.currentState!;
                          if (form.validate()){
                            var newitem = Item(productName: title, details: ['Branco', 'Grande'], stock: 40, price: 4500.0);
                            db.collection('items').add({
                              'productName': newitem.productName,
                              'details': newitem.details,
                              'price': newitem.price,
                              'stock': newitem.stock,
                            }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
                            print('Form is valid ${newitem.productName}');
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

