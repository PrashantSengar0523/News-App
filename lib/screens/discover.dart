import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/controllers/topreads_controller.dart';
import 'package:nexus_news/repos/news_repo.dart';
import 'package:nexus_news/screens/news_detail.dart';

import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/sizes.dart';
import 'package:nexus_news/utils/formatters/formatter.dart';
import 'package:nexus_news/utils/shimmers/topread_shimmer.dart';
import '../discoverwidgets/discover_headlines.dart';
import '../discoverwidgets/subtitle.dart';
import '../discoverwidgets/title.dart';
import '../utils/constants/responsive.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewsRepo());
    final controller = Get.put(TopreadsController());
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TTitle(
                title: 'Walk with Trend',
              ),
              const SubTitle(),
              const SizedBox(height: TSizes.spaceBtwItems),
              DiscoverHeadlines(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TTitle(
                title: 'Top reads of Tesla',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Obx(() {
                if (controller.isLoading.value) {
                  return const TopreadShimmer();
                }
                if (controller.topReads.isEmpty) {
                  return const Center(
                    child: Text(
                        "Nothing to report right now, but we'll have something soon!"),
                  );
                } else {
                  final topReadsToShow = controller.topReads
                      .take(controller.topReads.length)
                      .toList();
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: topReadsToShow.length,
                    itemBuilder: (context, index) {
                      final newsItem = topReadsToShow[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => NewsDetail(
                                imageUrl: newsItem.urlToImage ??
                                    'https://th.bing.com/th/id/OIP.5sxjZoTiRt11zVcvWyT19gHaEU?w=307&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                                author: newsItem.author ?? 'By Unknown',
                                description: newsItem.description ??
                                    'Description not available',
                                content:
                                    newsItem.content ?? 'Content not available',
                                headlines: newsItem.title ?? 'No title',
                                articleUrl: newsItem.url ?? 'Url not available',
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 10), // Space between items
                          // padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: TColors.light,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: newsItem.urlToImage ??
                                      'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1pBppR.img?w=768&h=512&m=6',
                                  errorWidget: (context, url, error) =>
                                      CachedNetworkImage(
                                          imageUrl:
                                              'https://th.bing.com/th/id/OIP.NwiZS9yjjNjb6lCfIz889AHaGo?w=209&h=187&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                                          width: double.infinity,
                                          height: Responsive.getHeight(
                                                  context) *
                                              0.20, // Adjust height as needed
                                          fit: BoxFit.cover),
                                  width: double.infinity,
                                  height: Responsive.getHeight(context) *
                                      0.20, // Adjust height as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8), // Add spacing between image and text
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  newsItem.title ?? '',
                                  style: TextStyle(
                                    fontFamily: 'Semibold',
                                    fontSize: Responsive.getWidth(context) *
                                        0.038, // Adjust text size based on screen width
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8), // Add spacing between text and row
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Icon(
                                            Iconsax.profile,
                                            size: Responsive.getWidth(context) *
                                                0.035,
                                          ),
                                        ),
                                        Text(
                                          "By ${newsItem.author ?? 'Unknown'}",
                                          style: TextStyle(
                                            fontFamily: 'Medium',
                                            color: TColors.textPrimary,
                                            fontSize: Responsive.getWidth(
                                                    context) *
                                                0.030, // Adjust text size based on screen width
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: Responsive.getWidth(context) *
                                              0.03,
                                          width: 2,
                                          decoration: BoxDecoration(
                                              color: TColors.darkerGrey,
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          TFormatter.formatDate(
                                              newsItem.publishedAt),
                                          style: TextStyle(
                                            fontFamily: 'Medium',
                                            color: TColors.textPrimary,
                                            fontSize: Responsive.getWidth(
                                                    context) *
                                                0.030, // Adjust text size based on screen width
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      CupertinoIcons.bookmark,
                                      size: Responsive.getWidth(context) *
                                          0.035, // Adjust icon size based on screen width
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
