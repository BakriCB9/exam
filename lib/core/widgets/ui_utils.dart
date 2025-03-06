import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static showLoading(BuildContext context) {
    showDialog(
        barrierColor: Colors.black.withOpacity(0.6),
        context: context,
        builder: (context) {
          return const PopScope(
              canPop: false,
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )));
        });
  }

  static hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showToastMessage(String text) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }
}
