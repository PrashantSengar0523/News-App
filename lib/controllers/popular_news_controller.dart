import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/models/headline_model.dart';
import 'package:nexus_news/utils/constants/api_constants.dart';
import '../repos/news_repo.dart';

class PopularNewsController extends GetxController {
  static PopularNewsController get instance => Get.find();
  final NewsRepo newsRepo = Get.find<NewsRepo>();
  var popularNews = <HeadlineModel>[].obs;
  var isLoading = false.obs;

  Future<void> getPopularNews(String popularCategory) async {
    try {
      isLoading.value = true;
      List<HeadlineModel> fetchPopularNews = [];

      switch (popularCategory) {
        case 'Home':
          fetchPopularNews = await NewsRepo.instance.getPopularNews(ApiConstants.popularNews);
          break;
        case 'Business':
          fetchPopularNews = await NewsRepo.instance.getPopularNews(ApiConstants.popularBusinessNews);
          break;
        case 'Sports':
          fetchPopularNews = await NewsRepo.instance.getPopularNews(ApiConstants.popularSportsNews);
          break;
        case 'Education':
          fetchPopularNews = await NewsRepo.instance.getPopularNews(ApiConstants.popularHealthNews);
          break;
        case 'Technology':
          fetchPopularNews = await NewsRepo.instance.getPopularNews(ApiConstants.popularTechNews);
          break;
        default:
          fetchPopularNews = await NewsRepo.instance.getPopularNews(ApiConstants.popularNews);
      }

      // Update the popular news list
      popularNews.value = fetchPopularNews;
       // Debug print for processed headlines
      debugPrint('Processed headlines: ${popularNews.map((popularNewsho) => popularNews.toJson()).toList()}');

    } catch (e) {
      // Handle error (optional: log or show a message)
      debugPrint('Error fetching popular news: $e');
    } finally {
      // Ensure loading is set to false when done
      isLoading.value = false;
    }
  }
}
