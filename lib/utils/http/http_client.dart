import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = 'https://newsapi.org/v2'; 
  static const String apiKey = 'your_api_key';  // Add your API key here

  // Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      // Constructing the full URL with API key (if required by the API)
      final response = await http.get(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: {
          'Authorization': 'Bearer $apiKey',  // Example if API key is needed
          'Upgrade': 'h2c',  // Optional, to request HTTP/2 Cleartext if required by server
        },
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 426:
        throw Exception('Failed to load data: Upgrade Required (426). The server requires an upgrade to a new protocol.');
      case 401:
        throw Exception('Unauthorized access - check your API key (401).');
      case 500:
        throw Exception('Internal Server Error (500). Please try again later.');
      default:
        throw Exception('Failed to load data: ${response.statusCode}.');
    }
  }
}
