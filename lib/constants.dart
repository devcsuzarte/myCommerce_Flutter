import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFD8E2FF);
const kSecondaryColor = Color(0xFF172E54);


const kBoldTextStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const kBoldMediumTextStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

const kNormalTextStyle = TextStyle(
  color: Colors.black54,
);

const kInputDecoration = InputDecoration(
  labelText: 'Label Text',
  floatingLabelBehavior: FloatingLabelBehavior.always,
  hintStyle: TextStyle(
    color: Colors.black,
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFFAECCC4), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFFAECCC4),width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextFieldSeparator = SizedBox(height: 20);
