import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/models/headline_model.dart';
import 'package:nexus_news/repos/news_repo.dart';
import 'package:nexus_news/utils/constants/api_constants.dart';

class TopreadsController extends GetxController{
  static TopreadsController get instance=>Get.find();

  var topReads=<HeadlineModel>[].obs;
  var isLoading =false.obs;
  final NewsRepo newsRepo=Get.put(NewsRepo());

  @override
void onInit() {
  super.onInit();
  getTopReads(); // Call API when the controller initializes
}

  Future<void> getTopReads()async{
try {
  isLoading.value = true;
  final response = await NewsRepo.instance.getTopReads(ApiConstants.topReads);
  if (response.isNotEmpty) {
    topReads.value = response;
    debugPrint('Top Reads Data Fetched: ${topReads.length} items');
  } else {
    debugPrint('No data fetched from API.');
  }
} catch (e) {
  debugPrint('Error fetching headlines: $e');
} finally {
  isLoading.value = false;
}

  }
}