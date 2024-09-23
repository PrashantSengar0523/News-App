import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenUrlWidget {


  static void openUrlWeb(String articleUrl) async {
    final Uri url = Uri.parse(articleUrl);
    if (!await launchUrl(url)) {
      throw 'Could not launch $articleUrl';
    }
  }

  static void openUrlAndroid(String articleUrl)async{
     WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Allow JavaScript
      ..setBackgroundColor(const Color(0x00000000)) // Transparent background
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // You can show a loading indicator here if needed
          },
          onPageFinished: (String url) {
            // Stop loading indicator here
          },
          onNavigationRequest: (NavigationRequest request) {
            // Allow only HTTPs links
            if (request.url.startsWith('https://')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(articleUrl)); 
   
  }

}

class WebViewPageFor extends StatefulWidget {
  final String articleUrl;

  const WebViewPageFor({super.key, required this.articleUrl});

  @override
  State<WebViewPageFor> createState() => _WebViewPageForState();
}

class _WebViewPageForState extends State<WebViewPageFor> {

  @override
  void initState() {
    super.initState();
    WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Allow JavaScript
      ..setBackgroundColor(const Color(0x00000000)) // Transparent background
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // You can show a loading indicator here if needed
          },
          onPageFinished: (String url) {
            // Stop loading indicator here
          },
          onNavigationRequest: (NavigationRequest request) {
            // Allow only HTTPs links
            if (request.url.startsWith('https://')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.articleUrl)); // Load the URL
  }
  
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  
}
