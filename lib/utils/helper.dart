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

const credit="credit";
const debit="debit";







class CustomToast extends StatelessWidget {
  final String message;
  final bool isError;

  const CustomToast({
    Key? key,
    required this.message,
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color:  primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ToastService2 {
  static final ToastService2 _instance = ToastService2._internal();

  factory ToastService2() {
    return _instance;
  }

  ToastService2._internal();

  GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();

  void showToast({required String message, bool isError = false}) {
    final overlay = overlayKey.currentState;
     OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.width,
          child: Dismissible(

            key: UniqueKey(),
            direction: DismissDirection.up,
            onDismissed: (direction) {
              Future.delayed(const Duration(seconds: 3), () {
                overlayEntry?.remove();
              });
            },
            child: CustomToast(
              message: message,
              isError: isError,
            ),
          ),
        );
      },
    );

    overlay?.insert(overlayEntry);
  }
}