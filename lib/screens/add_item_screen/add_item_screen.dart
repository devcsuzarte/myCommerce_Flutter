import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycommerce/constants.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/widgets/add_item_widgets/add_detail.dart';
import 'package:mycommerce/widgets/add_item_widgets/detailList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String? imagePath;
  File? imageFile;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      imageFile = File(pickedFile.path);
      uploadImage();
    }
  }

  Future<void> uploadImage() async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/difi9kcoo/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'commerce'
      ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));
    final response = await request.send();
    if(response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      setState(() {
        final url = jsonMap['url'];
        imagePath = url;
      });
    }
  }


//child: imagePath != null ? Image.network(imagePath!) : Icon(CupertinoIcons.photo),
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de Produto",
            style: TextStyle(
              color: kAppBarTitleColor
            ),
          ),
          backgroundColor: kSecondaryColor,
        ),
          body:  Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                          ),
                          backgroundImage: imagePath != null ? NetworkImage(imagePath!) : AssetImage('assets/Image-not-found.png'),
                          minRadius: 10,
                        ),
                      )
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(
                                    'Preencha as informações',
                                    style: TextStyle(
                                      fontSize: 15
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
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AddDetail(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.20,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: DetailList(),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: kPrimaryColor,
                                backgroundColor: kSecondaryColor,
                              ),
                                onPressed: () {
                                  final form = formKey.currentState!;
                                  if (form.validate()){
                                    var newItem = Item(
                                        productName: title.toUpperCase(),
                                        productUrlImage: imagePath,
                                        details: Provider.of<ItemData>(context, listen: false).detailsString,
                                        stock: stock,
                                        price: price);
                                    ItemData().registerItem(newItem);
                                    form.reset();
                                    Provider.of<ItemData>(context, listen: false).cleanDetailsList();
                                    print('Form is valid ${newItem.productName}');
                                  }
                                },
                                child: Text('Cadastrar'),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ) ;
  }
}

