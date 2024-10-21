import 'package:flutter/cupertino.dart';
import 'package:mycommerce/widgets/navigation_bar/appbar_cupertino.dart';

class CupertinoAddItemScreen extends StatelessWidget {
  const CupertinoAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: AppbarCupertino(
          navBarTitle: 'Cadastro de Produto',
            body: SafeArea(
                child: ListView(
                  children: [
                    CupertinoFormSection(
                      margin: EdgeInsets.all(12),
                      header: Text('Preencha as informações'),
                        children: [
                          CupertinoTextFormFieldRow(
                            placeholder: 'Título',
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'Estoque',
                                ),
                              ),
                              Expanded(
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'Preço',
                                ),
                              ),
                            ],
                          ),
                        ],
                    ),
                    CupertinoFormSection(
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
                                  placeholder: 'Propriedade',
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'Valor',
                                ),
                              ),
                              Expanded(
                                  child: CupertinoButton(
                                      child: Icon(CupertinoIcons.add_circled_solid),
                                      onPressed: () {
                                        print('Add detail pressed');
                                      })
                              ),
                            ],
                          ),
                        ],
                    ),
                  ],
                ),
            ),
        ),
    ) ;
  }
}

