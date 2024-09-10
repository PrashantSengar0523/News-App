import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  static HomeSliderController get instance => Get.find();

  // This is an observable variable that holds the current index of the carousel
  final carouselCurrentIndex = 0.obs;

  // This method updates the carouselCurrentIndex with the current index
  void pageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }
}
