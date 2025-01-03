import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Colors.white;
const kSecondaryColor = Color(0xFF4A90E2);
const kTitleColor = Color(0xFF0D0D0D);
const kTextColor = Color(0xFF828285);
const kAppBarTitleColor = Colors.white;
// #0C183E
// #4CD0FE

const kCartEmptyAlertDialogTitle = Text('Nenhum item selecionado');
const kCartEmptyAlertDialogDescription = Text('Selecione itens para prosseguir com a venda');
const kCartEmptyAlertActionTitle = Text(
  'Ok',
  style: TextStyle(
      color: CupertinoColors.activeBlue
  ),
);

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
  labelStyle: TextStyle(
    color: Colors.black
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kSecondaryColor, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kSecondaryColor,width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kSearchInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Pesquisar produto',
  floatingLabelBehavior: FloatingLabelBehavior.never,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  prefixIcon: Icon(CupertinoIcons.search),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kPrimaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kSecondaryColor,width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);


const kTextFieldSeparator = SizedBox(height: 20);
