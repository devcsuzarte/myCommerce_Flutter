import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:mycommerce/models/detail_model.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemData extends ChangeNotifier {
  final db = FirebaseFirestore.instance;

  List<Item> itemsList = [];
  List<Item> finishSaleList = [];
  List<Detail> detailList = [Detail('Propriedade', 'Descrição', TextEditingController(), TextEditingController())];

  void cleanFinishSaleList() {
    finishSaleList = [];
    cleanCheckedItems();
  }
  void deleteItem(String docID) {
    db.collection('items').doc(docID).delete().then(
          (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
    );
    notifyListeners();
  }

  void updateItem(String docID, int newStock, double newPrice){
    db.collection('items').doc(docID).update({
      "stock": newStock,
      "price": newPrice,
    }).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

    notifyListeners();
  }

  void updateStock(String docID, int newStock) {

    db.collection('items').doc(docID).update({
      "stock": newStock,
    }).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

  void registerItem(Item newItem){
    db.collection('items').add({
      'productName': newItem.productName,
      'details': newItem.details,
      'price': newItem.price,
      'stock': newItem.stock,
    }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
  }
  void registerSale() {
    for(var item in finishSaleList) {
      if(item.amount! > item.stock!) {
        print('Amount not available');
        break;
      } else {
        db.collection('bill').add({
          'dateTime': DateTime.now().millisecondsSinceEpoch,
          'itemsSold': mapItemSoldList,
          'totalBill': getTotalBillValue(),
        }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
        updateStock(item.id!, item.stock! - item.amount!);
        print("DEBUG: Amount: ${item.amount} Stock: ${item.stock}");
      }
    }
    finishSaleList = [];
  }

  void amountSoldChanged(int index, int amount) {
    finishSaleList[index].amount = amount;
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

  void cleanCheckedItems(){
    for (var i=0; i < itemsList.length; i++){
      if(itemsList[i].isSelected){
        itemsList[i].isSelected = itemsList[i].toggleIsSelected();
      }
    }
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

  double getTotalBillValue() {
   double total = 0.0;
   for(var item in finishSaleList) {
     total =total + (item.price! * item.amount!);
   }
   return total;
   }

  String getDetailsToItemCell(List<dynamic> itemDetails) {
    String details = itemDetails.reduce((value, element) => value + " | " + element);
    print("DEBUG: DETAILS $details");
    return details;
  }
  List<String> get detailsString {
    List<String> details = [];

    for (var detail in detailList) {
      details.add('${detail.propertyTextController.text}: ${detail.descriptionTextController.text}');
    }
    return details;
  }

  void addDetail() {
    detailList.add(Detail('Propriedade', 'Descrição', TextEditingController(), TextEditingController()));
    notifyListeners();
  }

  void removeDetail(int index) {
    detailList.removeAt(index);
    notifyListeners();
  }

}