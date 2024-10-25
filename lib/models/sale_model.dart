import 'package:mycommerce/models/item_model.dart';

class Sale {

  DateTime dateTime;
  List<ItemSold> itemsSold;
  double totalBill;

  Sale({
    required this.dateTime,
    required this.itemsSold,
    required this.totalBill
});
}

class ItemSold {
  String title;
  int amount;
  double price;

  ItemSold({
    required this.title,
    required this.amount,
    required this.price,
});

}