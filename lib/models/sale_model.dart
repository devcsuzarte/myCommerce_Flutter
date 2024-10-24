import 'package:mycommerce/models/item_model.dart';

class Sale {

  DateTime dateTime;
  //List<Item> itemsSold;
  double totalBill;

  Sale({
    required this.dateTime,
    //required this.itemsSold,
    required this.totalBill
});
}