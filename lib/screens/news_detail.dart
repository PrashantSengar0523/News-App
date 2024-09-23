import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import 'package:nexus_news/utils/custom_widgets.dart/open_url_widget.dart';
import 'package:nexus_news/utils/popups/loaders.dart';
import '../utils/constants/sizes.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({
    super.key,
    required this.imageUrl,
    required this.headlines,
    required this.description,
    required this.author,
    required this.content,
    required this.articleUrl, // Add articleUrl parameter
  });

  final String imageUrl;
  final String headlines;
  final String description;
  final String author;
  final String content;
  final String articleUrl; // Add URL to the full article

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image container
                Container(
                  width: double.infinity,
                  height: Responsive.getHeight(context) / 1.8,
                  color: TColors.darkGrey,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) => CachedNetworkImage(
                        imageUrl:
                            'https://th.bing.com/th/id/OIP.NwiZS9yjjNjb6lCfIz889AHaGo?w=209&h=187&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                        width: double.infinity,
                        height: Responsive.getHeight(context) *
                            0.20, // Adjust height as needed
                        fit: BoxFit.cover),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                // Blurred effect at the bottom using BackdropFilter
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          height: Responsive.getHeight(context) * 0.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Back button
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    height: Responsive.getHeight(context) * 0.05,
                    width: Responsive.getWidth(context) * 0.085,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: TColors.primary.withOpacity(0.5),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: Responsive.getWidth(context) * 0.04,
                        ),
                        color: TColors.white,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ),
                // News headline on top of the blurred area
                Positioned(
                  bottom: 0,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headlines,
                          style: TextStyle(
                            color: TColors.white,
                            fontFamily: 'Bold',
                            fontSize: Responsive.getWidth(context) * 0.045,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                author,
                                style: TextStyle(
                                  color: TColors.textWhite,
                                  fontFamily: 'Medium',
                                  fontSize:
                                      Responsive.getWidth(context) * 0.038,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Icon(
                              CupertinoIcons.arrow_turn_up_right,
                              size: Responsive.getWidth(context) * 0.048,
                              color: TColors.white,
                            ),
                            const SizedBox(
                              width: TSizes.defaultSpace,
                            ),
                            Icon(
                              CupertinoIcons.bookmark,
                              size: Responsive.getWidth(context) * 0.044,
                              color: TColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Column(
                  children: [
                    Text(
                      '$description\n',
                      style: TextStyle(
                        fontFamily: 'Semibold',
                        fontSize: Responsive.getWidth(context) * 0.038,
                        color: TColors.darkerGrey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '$content ...\n',
                      style: TextStyle(
                        fontFamily: 'Semibold',
                        fontSize: Responsive.getWidth(context) * 0.038,
                        color: TColors.darkerGrey,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (kIsWeb) {
                          OpenUrlWidget.openUrlWeb(articleUrl);
                        } else {
                          TLoaders.customToast(message: "Unable to open it.");
                          debugPrint(
                              'Unable to implement webview_flutter package');
                        }
                      },
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Row(
                            children: [
                              Text(
                                'Read Full Article ',
                                style: TextStyle(
                                    color: TColors.primary,
                                    fontSize:
                                        Responsive.getWidth(context) * 0.035,
                                    fontFamily: 'Semibold'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: TColors.primary,
                                size: Responsive.getWidth(context) * 0.035,
                              )
                            ],
                          )),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
