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
    if(Platform.isAndroid) {
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
            title: kCartEmptyAlertDialogTitle,
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget> [
                  kCartEmptyAlertDialogDescription,
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: kCartEmptyAlertActionTitle,
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
        title: kCartEmptyAlertDialogTitle,
        content: kCartEmptyAlertDialogDescription,
        actions: <CupertinoDialogAction> [
          CupertinoDialogAction(
            child: kCartEmptyAlertActionTitle,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

}