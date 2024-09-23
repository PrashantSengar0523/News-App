import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/models/headline_model.dart';
import 'package:nexus_news/repos/news_repo.dart';
import 'package:nexus_news/utils/constants/api_constants.dart';

class HeadlineController extends GetxController {
  var headlines = <HeadlineModel>[].obs;
  final NewsRepo newsRepo = Get.find<NewsRepo>();
  var isLoading = false.obs;

  // Fetch headlines based on category
  Future<void> getHeadlinesByCategory(String category) async {
    isLoading.value = true; // Set loading to true at the start
    List<HeadlineModel> fetchedHeadlines=[];

    try {
      // Fetch headlines based on category
      switch (category) {
        case 'Home':
          fetchedHeadlines = await newsRepo.getHeadlines(ApiConstants.generalHeadlines);
          break;
        case 'Business':
          fetchedHeadlines = await newsRepo.getHeadlines(ApiConstants.usBusinessHeadlines);
          break;
        case 'Sports':
          fetchedHeadlines = await newsRepo.getHeadlines(ApiConstants.usSportsHeadlines);
          break;
        case 'Education':
          fetchedHeadlines = await newsRepo.getHeadlines(ApiConstants.usHealthHeadlines);
          break;
        case 'Technology':
          fetchedHeadlines = await newsRepo.getHeadlines(ApiConstants.usTechHeadlines);
          break;
        default:
          fetchedHeadlines = await newsRepo.getHeadlines(ApiConstants.generalHeadlines);
      }

      // Update headlines with fetched data
      headlines.value = fetchedHeadlines;

      // Debug print for processed headlines
      debugPrint('Processed headlines: ${headlines.map((headline) => headline.toJson()).toList()}');
      
    } catch (e) {
      debugPrint('Error fetching headlines: $e');
    } finally {
      isLoading.value = false; // Always set loading to false
    }
  }
}
