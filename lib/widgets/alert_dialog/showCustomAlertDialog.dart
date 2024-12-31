import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'dart:io' show Platform;

class CustomAlertDialog {
  Text alertTitle;
  Text  alertDescription;
  Text alertActionTitle;

  CustomAlertDialog({
    required this.alertActionTitle,
    required this.alertDescription,
    required this.alertTitle
  });

  void showCustomAlertDialog(BuildContext context) {
    if(Platform.isIOS) {
      _cupertinoDialog(context);
    } else {
      _materialDialog(context);
    }
  }

  Future<void> _materialDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: alertTitle,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget> [
                  alertDescription,
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: alertActionTitle,
              ),
            ],
          );
        }
    );
  }


  void _cupertinoDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: alertTitle,
        content: alertDescription,
        actions: <CupertinoDialogAction> [
          CupertinoDialogAction(
            child: alertActionTitle,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

}