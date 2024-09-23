import 'package:get/get.dart';

import '../models/headline_model.dart';
import '../utils/http/http_client.dart';
// Import the HeadlineModel

class NewsRepo extends GetxController {
  static NewsRepo get instance => Get.find();

  // Fetch headlines based on category
  Future<List<HeadlineModel>> getHeadlines(String headlineCategory) async {
    try {
      // Make the GET request
      final response = await THttpHelper.get(headlineCategory);
      // Parse the articles into a list of HeadlineModel
      List articles = response['articles'];
      return articles.map((article) => HeadlineModel.fromJson(article)).toList();
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }

  //Fetch popular news based on category
  Future<List<HeadlineModel>> getPopularNews(String popularCategory)async{
    try{
      final response=await THttpHelper.get(popularCategory);
      List articles=response['articles'];
      return articles.map((article)=>HeadlineModel.fromJson(article)).toList();
    }catch(e){
      throw 'Something went wrong: $e';
    }
  }

  Future<List<HeadlineModel>> getTopReads(String topReads)async{
    try{
      final response=await THttpHelper.get(topReads);
      List articles=response['articles'];
      return articles.map((article)=>HeadlineModel.fromJson(article)).toList();
    }catch(e){
      throw 'Something went wrong $e';
    }
  }
}
