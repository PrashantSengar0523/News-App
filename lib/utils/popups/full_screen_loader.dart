import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {

  static void openLoadingDialog(String text,) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 200), // Adjust the spacing as needed
              Lottie.asset('assets/images/loader.json',height: 200,width: 200,fit: BoxFit.contain),
              const SizedBox(height: 50,),
              Text(text,style: const TextStyle(fontFamily: 'Regular',fontSize: 12,color: TColors.black))
            ],
          ),
        ),
      ),
    );
  }


  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator
  }
}
