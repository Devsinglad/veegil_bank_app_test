import 'package:flutter/material.dart';
import 'package:veegil_bank_app_test/utils/constants.dart';

class CustomToast extends StatelessWidget {
  final String message;
  final bool isError;

   const CustomToast({super.key, required this.message,  this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isError ? errorColor : primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
            child: Text( message,
              style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 16.0,),
            )
        ),
      ),
    );
  }
}


class ToastService {
  static void showToast(BuildContext context, {required String message, bool isError = false}) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.width,
          child: CustomToast(message: message, isError: isError,),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}