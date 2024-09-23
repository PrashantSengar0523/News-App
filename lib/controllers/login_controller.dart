import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/navigation_menu.dart';
import 'package:nexus_news/repos/authentication_repo.dart';
import 'package:nexus_news/repos/user_repo.dart';
import 'package:nexus_news/utils/popups/full_screen_loader.dart';
import 'package:nexus_news/utils/popups/loaders.dart';

class LoginController extends GetxController{
  static LoginController get instance=>Get.find();
  final userRepo=Get.put(UserRepo());
  //variables
  final togglepassword=true.obs;
  final emaiController=TextEditingController();
  final passwordController=TextEditingController();
  GlobalKey<FormState> loginForm=GlobalKey<FormState>();

  Future<void> login()async{
    try{
      //Loader
      TFullScreenLoader.openLoadingDialog('We are getting things ready for you...');
      
      // validation
      if(!loginForm.currentState!.validate()){TFullScreenLoader.stopLoading(); return;}


      //Login User 
     await AuthenticationRepo.instance.loginUser(emaiController.text.trim(),passwordController.text.trim());


      //Remove
      TFullScreenLoader.stopLoading();

      Get.offAll(()=>const NavigationMenu());

    }catch(e){
      //Remove
      TFullScreenLoader.stopLoading();
      
      //error
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}