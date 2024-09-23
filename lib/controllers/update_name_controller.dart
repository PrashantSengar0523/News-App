import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/controllers/user_contrller.dart';
import 'package:nexus_news/repos/user_repo.dart';
import 'package:nexus_news/utils/popups/full_screen_loader.dart';
import 'package:nexus_news/utils/popups/loaders.dart';


class UpdateNameController extends GetxController{
  static UpdateNameController get instance=>Get.find();
  final fullName=TextEditingController();
  UserController userController=UserController.instance;
  GlobalKey<FormState> changeName=GlobalKey<FormState>();
  
  @override
  void onInit(){
    super.onInit();
    initializeName();
  }

  Future<void> initializeName()async{
    fullName.text= userController.user.value.name;
  }


  Future<void> updateUserField()async{
    try{
      TFullScreenLoader.openLoadingDialog('We are updating your name');

      if(!changeName.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> updateUser={'name':fullName.text.trim()};
      await UserRepo.instance.updateUserRecord(updateUser);

      // userController.user.value.name=fullName.text.trim();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: '',message: 'Your name has been updated...');
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}

