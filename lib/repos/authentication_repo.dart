import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nexus_news/screens/auth.dart';
import 'package:nexus_news/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:nexus_news/utils/exceptions/firebase_exceptions.dart';

import '../navigation_menu.dart';
import '../screens/verify_email.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get user=>_auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    if(_auth.currentUser!=null){
      if(_auth.currentUser!.emailVerified){
        Get.offAll(()=>const NavigationMenu());
      }else{
        Get.to(()=>const VerifyEmail());
      }
    }
    else{deviceStorage.writeIfNull('isFirstTime', true);
    if (deviceStorage.read('isFirstTime') != true) {
      Get.offAllNamed('/Auth'); // Navigate to Auth screen
    } else {
      Get.offAllNamed('/Onboarding'); // Navigate to Onboarding screen
    }}
  }

/// Register User with Email
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }catch (e){
      throw 'Something went wrong.';
    }
  }

/// Verify User Email
  Future<void> verifyUseremail() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }catch (e){
      throw 'Something went wrong.';
    }
  }
  
  /// Login with Email and Password
  Future<UserCredential> loginUser(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }catch (e){
      throw 'Something went wrong.';
    }
  }
 
  /// Logout User
    Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      Get.offAll(()=>Auth());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }catch (e){
      throw 'Something went wrong.';
    }
  }

  /// Forgot Password
Future<void> forgotPassword(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message; 
  } on TFirebaseException catch (e) {
    throw TFirebaseException(e.code).message; 
  } on FormatException catch (_) {
    throw const FormatException('Invalid email format.');
  } catch (e) {
    throw 'Something went wrong. Please try again later.';
  }
}

}
