import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nexus_news/controllers/popular_news_controller.dart';
import 'package:nexus_news/repos/news_repo.dart';
import 'package:nexus_news/utils/shimmers/popular_shimmer.dart';
import 'package:provider/provider.dart';
import '../controllers/drawer_controller.dart';
import '../screens/news_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class PopularNews extends StatelessWidget {
  const PopularNews({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the necessary dependencies using Get.put
    Get.put(NewsRepo());
    final controller = Get.put(PopularNewsController());

    return Consumer<TDrawerController>(
      builder: (context, drawerController, child) {
        // Call the API based on the selected category
        controller.getPopularNews(drawerController.selectedCategory);

        return Obx(() {
          // Check if data is still being loaded
          if (controller.isLoading.value) {
            return const Center(
              child: PopularShimmer(),
            );
          }

          // If the data is loaded but the list is empty
          if (controller.popularNews.isEmpty) {
            return const Center(
              child: Text(
                  "We're gathering fresh news for you. Please come back later!"),
            );
          }

          // Limit the displayed news items to a maximum of 20
          final popularNewsToShow =
              controller.popularNews.sublist(15, 35).toList();

          // If the data is available, show the list
          return ListView.builder(
            shrinkWrap: true,
            itemCount: popularNewsToShow.length, // Use the limited list length
            itemBuilder: (context, index) {
              final newsItem =
                  popularNewsToShow[index]; // Get news data from limited list

              return GestureDetector(
                onTap: () {
                  Get.to(() => NewsDetail(
                        imageUrl: newsItem.urlToImage ??
                            'https://th.bing.com/th/id/OIP.kgfkdioyvqIrLPdA5bXckAHaE8?w=255&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                        headlines: newsItem.title ?? 'No Title',
                        description: newsItem.description ??
                            'Description is not Available',
                        author: newsItem.author ?? 'Unknown',
                        content: newsItem.content ?? 'No Content Available',
                        articleUrl: newsItem.url ?? 'Not Available',
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  height: Responsive.getWidth(context) * 0.25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: newsItem.urlToImage ??
                              'https://th.bing.com/th/id/OIP.kgfkdioyvqIrLPdA5bXckAHaE8?w=255&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                          errorWidget: (context, url, error) =>
                              CachedNetworkImage(
                            imageUrl:
                                'https://th.bing.com/th/id/OIP.NwiZS9yjjNjb6lCfIz889AHaGo?w=209&h=187&c=7&r=0&o=5&dpr=1.4&pid=1.7',
                            fit: BoxFit.cover,
                            height: Responsive.getWidth(context) * 0.25,
                            width: Responsive.getWidth(context) * 0.30,
                          ),
                          fit: BoxFit.cover,
                          height: Responsive.getWidth(context) * 0.25,
                          width: Responsive.getWidth(context) * 0.30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              newsItem.title ?? "No title available",
                              style: TextStyle(
                                fontFamily: 'Semibold',
                                fontSize: Responsive.getWidth(context) * 0.030,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 3,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Icon(
                                          Iconsax.profile,
                                          size: Responsive.getWidth(context) *
                                              0.03,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'By ${newsItem.author}',
                                        style: TextStyle(
                                          fontFamily: 'Regular',
                                          fontSize:
                                              Responsive.getWidth(context) *
                                                  0.03,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.bookmark_fill,
                                  size: Responsive.getWidth(context) * 0.03,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
