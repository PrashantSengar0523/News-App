import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nexus_news/screens/auth.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance=>Get.find();

  final storage=GetStorage();

  void navigateToAuthenticationScreen(){
      storage.write('isFirstTime', false);
      Get.to(()=>Auth());
  }
}