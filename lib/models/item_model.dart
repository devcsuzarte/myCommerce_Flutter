
class Item {
  int? stock;
  int? amount;
  String? productName;
  double? price;
  List<String>? details;
  String? id;
  bool isSelected;

  Item({
    this.productName,
    this.details,
    this.price,
    this.stock,
    this.id,
    this.amount = 1,
    this.isSelected = false,
  });

  bool toggleIsSelected() {
    print('CHECKBOX = $isSelected');
    return isSelected = !isSelected;
  }

}