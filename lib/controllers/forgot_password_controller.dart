import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/repos/authentication_repo.dart';
import 'package:nexus_news/screens/auth.dart';
import 'package:nexus_news/utils/popups/full_screen_loader.dart';

import '../utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance=>Get.find();

  //variables
  final email=TextEditingController();
  GlobalKey<FormState> forgotForm=GlobalKey<FormState>();


  Future<void> forgotPassword()async{
    try{
      //Loader
      TFullScreenLoader.openLoadingDialog('We are sending you a link to reset the password...');

      //validator
      if(!forgotForm.currentState!.validate()){TFullScreenLoader.stopLoading(); return;}

      //sending a Link
      await AuthenticationRepo.instance.forgotPassword(email.text.trim());
      TLoaders.errorSnackBar(title: 'Email Sent',message: 'We have sent you a link to your email.');


      //remove loader
      TFullScreenLoader.stopLoading();

      Get.offAll(()=>Auth());

    }catch(e){
      //Remove
      TFullScreenLoader.stopLoading();
      
      //error
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}