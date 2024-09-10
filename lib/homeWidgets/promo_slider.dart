import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/homeWidgets/breaking_news_image.dart';

import '../controllers/home_slider_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class TSliders extends StatelessWidget {
  const TSliders({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the CarouselSliderController
    final controller = Get.put(HomeSliderController());

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '   Breaking news',
                style: TextStyle(
                  fontFamily: 'Light',
                  fontSize: Responsive.getWidth(context) * 0.035,
                  color: TColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Obx(() => Row(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 4,
                      width: 14,
                      decoration: BoxDecoration(
                        color: controller.carouselCurrentIndex.value == index
                            ? TColors.primary
                            : TColors
                                .grey, // Change color based on active index
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
          items: const [
            BreakingNews(
              imageUrl:
                  'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1pBppR.img?w=768&h=512&m=6',
              headlines:
                  "The Centre cleared the last roadblock to national carrier Air India Ltd.’s merger with smaller rival Vistara, approving a S 360 million (276 million) investment by Singapore Airlines Ltd. into the new combined carrier.",
            ),
            BreakingNews(
              imageUrl: 'https://th.bing.com/th/id/OIP.CM8fKB8-P_CyPZcerM0c7QHaEK?w=290&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7',
              headlines: "India's Covid Crises Needs a New Lockdown",
            ),
            
          ],
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 0.95,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              // Call the method to update the index
              controller.pageIndicator(index);
            },
          ),
        ),
      ],
    );
  }
}
