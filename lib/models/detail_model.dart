import 'package:flutter/cupertino.dart';

class Detail {
  String property;
  String description;
  TextEditingController propertyTextController;
  TextEditingController descriptionTextController;

  Detail(
      this.property,
      this.description,
      this.propertyTextController,
      this.descriptionTextController
      );
}