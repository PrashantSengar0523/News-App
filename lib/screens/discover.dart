import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/screens/news_detail.dart';

import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/sizes.dart';
import '../discoverwidgets/search_field.dart';
import '../discoverwidgets/subtitle.dart';
import '../discoverwidgets/title.dart';
import '../utils/constants/responsive.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TTitle(),
            const SubTitle(),
            const SizedBox(height: TSizes.spaceBtwSections),
            const SearchField(),
            const SizedBox(height: TSizes.spaceBtwSections),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>const NewsDetail());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 10), // Space between items
                      padding: const EdgeInsets.all(10.0),
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
                              imageUrl:
                                  'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1pBppR.img?w=768&h=512&m=6',
                              width: double.infinity,
                              height: Responsive.getHeight(context) *
                                  0.18, // Adjust height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                              height: 8), // Add spacing between image and text
                          Text(
                            "India's Covid Crises Needs a New Lockdown",
                            style: TextStyle(
                              fontFamily: 'Bold',
                              fontSize: Responsive.getWidth(context) *
                                  0.045, // Adjust text size based on screen width
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                              height: 8), // Add spacing between text and row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(
                                      Iconsax.profile,
                                      size:
                                          Responsive.getWidth(context) * 0.035,
                                    ),
                                  ),
                                  Text(
                                    'By Jane Smith',
                                    style: TextStyle(
                                      fontFamily: 'Medium',
                                      color: TColors.textPrimary,
                                      fontSize: Responsive.getWidth(context) *
                                          0.035, // Adjust text size based on screen width
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Container(
                                    height: 14,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color: TColors.darkerGrey,
                                      borderRadius: BorderRadius.circular(1)
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Text(
                                    'Published At',
                                    style: TextStyle(
                                      fontFamily: 'Medium',
                                      color: TColors.textPrimary,
                                      fontSize: Responsive.getWidth(context) *
                                          0.035, // Adjust text size based on screen width
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                CupertinoIcons.bookmark,
                                size: Responsive.getWidth(context) *
                                    0.045, // Adjust icon size based on screen width
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
