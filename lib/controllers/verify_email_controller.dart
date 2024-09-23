import 'dart:async';  // For Timer
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nexus_news/navigation_menu.dart';
import 'package:nexus_news/utils/popups/loaders.dart';

import '../repos/authentication_repo.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _timer;  // Declare a timer for polling

  @override
  void onInit() {
    super.onInit();
    // Start email verification process when the screen loads
    sendEmailVerifyLink();

    // Start polling to check the email verification status
    _startEmailVerificationCheck();
  }

  // Send the email verification link to the user
  void sendEmailVerifyLink() async {
    try {
      await AuthenticationRepo.instance.verifyUseremail();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please check your inbox and verify email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Start a timer to check the email verification status periodically
  void _startEmailVerificationCheck() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      // Check if the email is verified
      await emailVerificationStatus();
    });
  }

  // Check the email verification status
  Future<void> emailVerificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.reload(); // Reload user info to get updated status

      if (user.emailVerified) {
        _timer?.cancel();  // Stop the timer once email is verified
        Get.offAll(() => const NavigationMenu());  // Navigate to NavigationMenu
      }
    }
  }

  @override
  void onClose() {
    // Cancel the timer if the user navigates away from the screen
    _timer?.cancel();
    super.onClose();
  }
}
