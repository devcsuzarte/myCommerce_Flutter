
class Item {
  int? stock;
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
    this.isSelected = false,
  });

  bool toggleIsSelected() {
    print('CHECKBOX = $isSelected');
    return isSelected = !isSelected;
  }

}