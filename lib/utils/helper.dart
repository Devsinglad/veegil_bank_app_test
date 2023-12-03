import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:veegil_bank_app_test/src/main.dart';
toastMessage({required String text, bool long = false, bool isError =false}) {
  Fluttertoast.showToast(
      gravity: ToastGravity.TOP,
      msg: text,
      toastLength:  Toast.LENGTH_LONG ,
      backgroundColor: Colors.blue,
      textColor: Colors.white);
}