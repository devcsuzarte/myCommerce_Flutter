import 'package:flutter/cupertino.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:mycommerce/models/bill_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemData extends ChangeNotifier {
  final db = FirebaseFirestore.instance;

  List<Item> itemsList = [
    // Item(
    //   productName: 'New item 1',
    //   details: ['Cor: Preta', 'Armazenamento: 128GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x1",
    // ),    Item(
    //   productName: 'New item 2',
    //   details: ['Cor: Azul', 'Armazenamento: 128GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x2",
    // ),    Item(
    //   productName: 'New item 3',
    //   details: ['Cor: Amarelo', 'Armazenamento: 128GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x3",
    // ),    Item(
    //   productName: 'New item 4',
    //   details: ['Cor: Vermelho', 'Armazenamento: 64GB'],
    //   price: 300.0,
    //   stock: 98,
    //   id: "00x4",
    // ),
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

  List<Bill> salesList = [
    // Bill(
    //     dateTime: DateTime.now(),
    //     itemsSold: [Item(productName: 'Macbook Air 13', price: 350.0, stock: 2), Item(productName: 'Macbook Air 13', price: 350.0, stock: 2), Item(productName: 'Macbook Air 13', price: 350.0, stock: 2),],
    //     totalBill: 55000.77
    // ),      Bill(
    //     dateTime: DateTime.now(),
    //     itemsSold: [Item(productName: 'Macbook Air 13', price: 350.0, stock: 2), Item(productName: 'Macbook Air 13', price: 350.0, stock: 2), Item(productName: 'Macbook Air 13', price: 350.0, stock: 2),],
    //     totalBill: 55000.77
    // ),      Bill(
    //     dateTime: DateTime.now(),
    //     itemsSold: [Item(productName: 'Macbook Air 13', price: 350.0, stock: 2), Item(productName: 'Macbook Air 13', price: 350.0, stock: 2), Item(productName: 'Macbook Air 13', price: 350.0, stock: 2),],
    //     totalBill: 55000.77
    // ),
  ];

  List<Item> finishSaleList = [];

  void registerSale() {
    db.collection('bill').add({
      'dateTime': DateTime.now().millisecondsSinceEpoch,
      'itemsSold': mapItemSoldList,
      'totalBill': 3249.34,
    }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
    finishSaleList = [];
    notifyListeners();
  }

  List<dynamic> get mapItemSoldList{
    List<Map<String, dynamic>> soldList = [];
    for (var item in finishSaleList) {
      Map<String, dynamic> itemSold = {
        'title': item.productName!,
        'amount': item.amount!,
        'price': item.price,
      };
      soldList.add(itemSold);
    }
    return soldList;
  }

  List<Item>  getBillListFromMap(List<dynamic> itemOnBill) {
    List<Item> itemsSold = [];

    for(var item in itemOnBill) {

      final title = item['title'];
      final amount = item['amount'];
      print('DEBUG: Amount: $amount');
      final price = item['price'];
      final itemToBillList = Item(
        productName: title,
        amount: amount,
        price: price,
      );
      itemsSold.add(itemToBillList);
    }
    return itemsSold;
  }

  void checkBoxPressed(int index) {
    itemsList[index].isSelected = itemsList[index].toggleIsSelected();

    if (itemsList[index].isSelected) {
      finishSaleList.add(itemsList[index]);
    } else {
      finishSaleList.remove(itemsList[index]);
    }
    for (Item item in finishSaleList) {
      print(item.productName);
    }
    notifyListeners();
  }

}