
class Item {
  int? stock;
  int? amount;
  String? productName;
  String? productUrlImage;
  double? price;
  List<dynamic>? details;
  String? id;
  bool isSelected;

  Item({
    this.productName,
    this.productUrlImage,
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