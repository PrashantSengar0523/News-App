
/* -- LIST OF Constants used in APIs -- */

// Example

class ApiConstants {
  /// News Headlines
  static const String apiKey = 'be0f2cbb206a403bb6aa01f67b34861a';

  static const String generalHeadlines = '/top-headlines?sources=bbc-news&apiKey=$apiKey';
  static const String usBusinessHeadlines = '/top-headlines?country=us&category=business&apiKey=$apiKey';
  static const String usHealthHeadlines = '/top-headlines?country=us&category=health&apiKey=$apiKey';
  static const String usSportsHeadlines = '/top-headlines?country=us&category=sports&apiKey=$apiKey';
  static const String usTechHeadlines = '/top-headlines?country=us&category=technology&apiKey=$apiKey';

  // Popular News
  static const String popularNews = '/everything?q=general&apiKey=$apiKey';
  static const String popularBusinessNews = '/everything?q=business&sortBy=popularity&apiKey=$apiKey';
  static const String popularHealthNews = '/everything?q=health&sortBy=popularity&apiKey=$apiKey';
  static const String popularSportsNews = '/everything?q=sports&sortBy=popularity&apiKey=$apiKey';
  static const String popularTechNews = '/everthing?q=technology&sortBy=popularity&apiKey=$apiKey';

  // Top Reads of the Day
  static const String topReads = '/top-headlines?q=tesla&from=2024-09-01sortBy=publishAt&apiKey=$apiKey';
}
