import 'package:flutter/cupertino.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/models/sale_model.dart';

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
    Item(
      productName: 'New item 1',
      details: ['Cor: Preta', 'Armazenamento: 128GB'],
      price: 300.0,
      stock: 98,
      id: "00x5",
    ),    Item(
      productName: 'New item 2',
      details: ['Cor: Azul', 'Armazenamento: 128GB'],
      price: 300.0,
      stock: 98,
      id: "00x6",
    ),    Item(
      productName: 'New item 3',
      details: ['Cor: Amarelo', 'Armazenamento: 128GB'],
      price: 300.0,
      stock: 98,
      id: "00x7",
    ),    Item(
      productName: 'New item 4',
      details: ['Cor: Vermelho', 'Armazenamento: 64GB'],
      price: 300.0,
      stock: 98,
      id: "00x8",
    ),
  ];

  List<Sale> salesList = [
    Sale(
        dateTime: DateTime.now(),
        itemsSold: [ItemSold(title: 'Macbook Air 13', price: 350.0, amount: 2), ItemSold(title: 'PC Gamer Intel', price: 350.0, amount: 2), ItemSold(title: 'Galaxy Buds Live', price: 350.0, amount: 2)],
        totalBill: 55000.77
    ),    Sale(
        dateTime: DateTime.now(),
        itemsSold: [ItemSold(title: 'iPhone 13 Pro Max', price: 350.0, amount: 2), ItemSold(title: 'title', price: 350.0, amount: 2), ItemSold(title: 'title', price: 350.0, amount: 2)],
        totalBill: 55000.77
    ),    Sale(
        dateTime: DateTime.now(),
        itemsSold: [ItemSold(title: 'Laranja', price: 350.0, amount: 2), ItemSold(title: 'title', price: 350.0, amount: 2), ItemSold(title: 'title', price: 350.0, amount: 2)],
        totalBill: 55000.77
    ),
  ];
}