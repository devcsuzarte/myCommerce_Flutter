import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycommerce/models/detail_model.dart';
import 'package:mycommerce/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemData extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final _dbUserUID = FirebaseAuth.instance.currentUser!.uid;

  List<Item> itemsList = [];
  List<Item> finishSaleList = [];
  List<Detail> detailList = [];

  String searchText = '';
  String dbCommerceUID = '';
  bool saleIsEnable = false;

  void toggleSaleState() {
    if(saleIsEnable) {
      saleIsEnable = false;
      cleanFinishSaleList();
    } else {
      saleIsEnable = true;
    }
    notifyListeners();
  }

  void cleanDetailsList(){
    detailList = [];
    notifyListeners();
  }

  void getItemFromFirebase(String search) async {
    print('USER UID FROM COMMERCE DATA: $_dbUserUID');
    List<Item> itemsListSnapshot = [];
    await db.collection("items@$_dbUserUID").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var item in querySnapshot.docs) {
          print('${item.id} => ${item.data()}');
          final productName = item['productName'];
          final price = item['price'];
          final stock = item['stock'];
          final details = item['details'];
          final imageURL = item['imageURL'];
          final id = item.id;

          final itemRecived = Item(
            productName: productName,
            price: price,
            stock: stock,
            details: details,
            id: id,
            productUrlImage: imageURL
          );
          itemsListSnapshot.add(itemRecived);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    if(search.isNotEmpty){
      print('SEARCH: $search');
      List<Item> searchList = [];

      for(Item item in itemsListSnapshot) {
        if(item.productName!.contains(search.toUpperCase())) {
          searchList.add(item);
        }
      }
      itemsList = searchList;
      notifyListeners();
    } else {
      itemsList = itemsListSnapshot;
      notifyListeners();
    }

  }

  void deleteItem(String docID) {
    db.collection('items@$_dbUserUID').doc(docID).delete().then(
          (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
    );
    finishSaleList = [];
    getItemFromFirebase('');
  }

  void updateItem(String docID, int newStock, double newPrice){
    db.collection('items@$_dbUserUID').doc(docID).update({
      "stock": newStock,
      "price": newPrice,
    }).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

    getItemFromFirebase('');
  }

  void updateStock(String docID, int newStock) {

    db.collection('items@$_dbUserUID').doc(docID).update({
      "stock": newStock,
    }).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
    getItemFromFirebase('');

  }

  void registerItem(Item newItem){
    try {
      db.collection('items@$_dbUserUID').add({
        'productName': newItem.productName,
        'details': newItem.details,
        'price': newItem.price,
        'stock': newItem.stock,
        'imageURL': newItem.productUrlImage,
      }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
      notifyListeners();
      getItemFromFirebase('');
    } catch (e) {
      print('DEBUG: Erro to register item $e');
    }

  }
  bool registerSale() {
    bool amountIsAvailable = true;
    for(var item in finishSaleList) {
      if(item.amount! > item.stock!) {
        print('Amount not available');
        amountIsAvailable = false;
        break;
      } else {
        updateStock(item.id!, item.stock! - item.amount!);
        print("DEBUG: Amount: ${item.amount} Stock: ${item.stock}");
      }
    }

    if(amountIsAvailable){
      db.collection('bill@$_dbUserUID').add({
        'dateTime': DateTime.now().millisecondsSinceEpoch,
        'itemsSold': mapItemSoldList,
        'totalBill': getTotalBillValue(),
      }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
      cleanFinishSaleList();
      notifyListeners();
      return true;
    } else {
      cleanFinishSaleList();
      notifyListeners();
      return false;
    }
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

  void cleanFinishSaleList() {
    finishSaleList = [];
    cleanCheckedItems();
    notifyListeners();
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
     total = total + (item.price! * item.amount!);
   }
   return total;
   }

  String getDetailsToItemCell(List<dynamic> itemDetails) {
    if (itemDetails.isEmpty) {
      return '';
    }
    String details = itemDetails.reduce((value, element) => value + " | " + element);
    return details;
  }
  List<String> get detailsString {
    List<String> details = [];

    for (var detail in detailList) {
      details.add('${detail.property}: ${detail.description}'.toUpperCase());
    }
    return details;
  }

  void addDetail(String propertyText, descriptionText) {
    detailList.add(
        Detail(
          propertyText,
          descriptionText,
        ),
    );
    notifyListeners();
  }

  void removeDetail(int index) {
    detailList.removeAt(index);
    notifyListeners();
  }

  void removeItemFromFinishSale(int index) {
    finishSaleList.removeAt(index);
    notifyListeners();
  }

}