import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/models/user_model.dart';
import 'package:nexus_news/repos/authentication_repo.dart';
import 'package:nexus_news/repos/user_repo.dart';
import 'package:nexus_news/screens/verify_email.dart';
import 'package:nexus_news/utils/popups/full_screen_loader.dart';
import 'package:nexus_news/utils/popups/loaders.dart';

class SignupController extends GetxController{
  static SignupController get instance=>Get.find();
  final userRepo=Get.put(UserRepo());
  //variables
  final privacyPolicy=false.obs;
  final togglepassword=true.obs;
  final nameController=TextEditingController();
  final emaiController=TextEditingController();
  final passwordController=TextEditingController();
  GlobalKey<FormState> signupForm=GlobalKey<FormState>();

  Future<void> signup()async{
    try{
      //Loader
      TFullScreenLoader.openLoadingDialog('We are processing your information...');
      
      // validation
      if(!signupForm.currentState!.validate()){TFullScreenLoader.stopLoading(); return;}

      // privacy policy
      if(!privacyPolicy.value){
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'Oh Snap', message: 'In order to create account you must have read and accept the Privacy Policy and Terms of Use');
        return;
      }

      //Reister 
     final userCredential =await AuthenticationRepo.instance.registerWithEmailAndPassword(emaiController.text.trim(),passwordController.text.trim());

      //Save userRecord
      final user=UserModel(id: userCredential.user!.uid, name: nameController.text.trim(), email: emaiController.text.trim());

      await userRepo.saveRecord(user);

      //Remove
      TFullScreenLoader.stopLoading();

     Get.to(()=>const VerifyEmail());

    }catch(e){
      //Remove
      TFullScreenLoader.stopLoading();
      
      //error
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}