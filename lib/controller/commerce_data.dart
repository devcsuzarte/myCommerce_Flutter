import 'package:flutter/cupertino.dart';
import 'package:mycommerce/models/item_model.dart';

class ItemData extends ChangeNotifier {
  List<Item> itemsList = [
    Item(
      productName: 'New item 1',
      details: ['Cor: Preta', 'Armazenamento: 128GB'],
      price: 300.0,
      stock: 98,
      id: "00x1",
    ),    Item(
      productName: 'New item 2',
      details: ['Cor: Azul', 'Armazenamento: 128GB'],
      price: 300.0,
      stock: 98,
      id: "00x2",
    ),    Item(
      productName: 'New item 3',
      details: ['Cor: Amarelo', 'Armazenamento: 128GB'],
      price: 300.0,
      stock: 98,
      id: "00x3",
    ),    Item(
      productName: 'New item 4',
      details: ['Cor: Vermelho', 'Armazenamento: 64GB'],
      price: 300.0,
      stock: 98,
      id: "00x4",
    ),
    // Item(
    //   productName: 'New item 1',
    //   details: ['Cor: Preta', 'Armazenamento: 128GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x5",
    // ),    Item(
    //   productName: 'New item 2',
    //   details: ['Cor: Azul', 'Armazenamento: 128GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x6",
    // ),    Item(
    //   productName: 'New item 3',
    //   details: ['Cor: Amarelo', 'Armazenamento: 128GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x7",
    // ),    Item(
    //   productName: 'New item 4',
    //   details: ['Cor: Vermelho', 'Armazenamento: 64GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x8",
    // ),
  ];


}