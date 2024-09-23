import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/controllers/headline_controller.dart';
import 'package:nexus_news/homeWidgets/breaking_news_image.dart';
import 'package:nexus_news/repos/news_repo.dart';
import 'package:nexus_news/utils/shimmers/headline_shimmer.dart';
import 'package:provider/provider.dart'; // Import provider

import '../controllers/home_slider_controller.dart';
import '../controllers/drawer_controller.dart'; // Import Drawer Controller
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class TSliders extends StatelessWidget {
  const TSliders({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    final homeSliderController = Get.put(HomeSliderController());
    final headlineController = Get.put(HeadlineController());
    Get.put(NewsRepo());

    // Fetch headlines when the selected category changes
    return Consumer<TDrawerController>(
      builder: (context, drawerController, child) {
        // Call the API based on the selected category
        headlineController.getHeadlinesByCategory(drawerController.selectedCategory);

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Breaking news - ${drawerController.selectedCategory}', // Display the category
                    style: TextStyle(
                      fontFamily: 'Light',
                      fontSize: Responsive.getWidth(context) * 0.035,
                      color: TColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(() => Row(
                  children: List.generate(6, (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: Responsive.getHeight(context) * 0.005,
                      width: Responsive.getWidth(context) * 0.015,
                      decoration: BoxDecoration(
                        color: homeSliderController.carouselCurrentIndex.value == index
                            ? TColors.primary
                            : TColors.grey, // Change color based on active index
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                )),
              ],
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (headlineController.isLoading.value) {
                return const HeadlineShimmer();
              } 
              if (headlineController.headlines.isEmpty) {
            return const Center(
              child: Text("Looks like we're out of stories for now, check back soon!"),
            );
          }
              else {
                // Limit the number of headlines to 6
                final headlinesToShow = headlineController.headlines.sublist(0,6).toList();
                
                return CarouselSlider(
                  items: headlinesToShow.map((headline) {
                    return BreakingNews(
                      imageUrl: headline.urlToImage ?? 'https://th.bing.com/th/id/OIP.NwiZS9yjjNjb6lCfIz889AHaGo?w=209&h=187&c=7&r=0&o=5&dpr=1.4&pid=1.7', // Use a default or placeholder image if null
                      headlines: headline.title ?? 'No Title', // Use a default title if null
                      description: headline.description ?? 'Description is not available',
                      author: headline.author ?? 'Unknown',
                      content: headline.content ?? 'Content not available',
                      articleUrl: headline.url ?? 'Not available',
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.95,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      homeSliderController.pageIndicator(index);
                    },
                  ),
                );
              }
            }),
          ],
        );
      },
    );
  }
}
