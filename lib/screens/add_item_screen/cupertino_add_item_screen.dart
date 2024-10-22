import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';

class CupertinoAddItemScreen extends StatefulWidget {
  const CupertinoAddItemScreen({super.key});

  @override
  State<CupertinoAddItemScreen> createState() => _CupertinoAddItemScreenState();
}

class _CupertinoAddItemScreenState extends State<CupertinoAddItemScreen> {
  final formKey = GlobalKey<FormState>();

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
                            validator: (title) {
                              if (title == null || title.isEmpty) {
                                return 'Insira um título válido';
                              } else {
                                return null;
                              }
                            },
                            placeholder: 'MAC BOOK AIR M1 256GB',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: CupertinoFormRow(
                                prefix: Text('Estoque'),
                                child: CupertinoTextFormFieldRow(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  placeholder: '10',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: CupertinoFormRow(
                                prefix: Text('Preço'),
                                child: CupertinoTextFormFieldRow(
                                  keyboardType: TextInputType.number,
                                  placeholder: 'R\$ 5200,00',
                                ),
                              ),
                            ),
                          ],
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
                            print('Form is valid');
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

