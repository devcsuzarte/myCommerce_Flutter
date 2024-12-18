import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../controller/commerce_data.dart';

class AddDetail extends StatelessWidget {
  const AddDetail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController propertyTextController = TextEditingController();
    TextEditingController descriptionTextController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: propertyTextController,
            decoration: kInputDecoration.copyWith(
                labelText: 'Propriedade',
                hintText: 'Ex: Cor'
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 3,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: descriptionTextController,
            decoration: kInputDecoration.copyWith(
                labelText: 'Valor',
                hintText: 'Ex: Preto'
            ),
          ),
        ),
        Flexible(
            child: IconButton(
                onPressed: () {
                  Provider.of<ItemData>(context, listen: false).addDetail(propertyTextController.text, descriptionTextController.text);
                },
                icon: Icon(CupertinoIcons.plus),
            )
        ),
      ],
    );
  }
}
