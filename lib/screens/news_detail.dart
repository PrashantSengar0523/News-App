import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import 'package:readmore/readmore.dart';

import '../utils/constants/sizes.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key});

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
                  height: Responsive.getHeight(context)/1.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://th.bing.com/th/id/OIP.CM8fKB8-P_CyPZcerM0c7QHaEK?w=290&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7', // Replace with your image URL
                      ),
                      fit: BoxFit.cover,
                    ),
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
                      color: Colors.white.withOpacity(0.6),
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
                          'The Centre cleared the last roadblock to national carrier Air India Ltd.’s merger with smaller rival Vistara.',
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
                                "By Jane Smith",
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
              padding: const EdgeInsets.all(12),
              child: ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. The Prime Minister Narendra Modi-led Union government has granted absolute powers to the Delhi Lieutenant Governor (L-G) to constitute any authority, board and commission such as the Delhi Commission for Women and the Delhi Electricity Regulatory Commission',
                trimLines: (Responsive.getHeight(context) * 0.02)
                    .round(), // Set the dynamic trim lines
                trimMode: TrimMode.Line, // Trim based on line count
                trimCollapsedText: 'Read more',
                trimExpandedText: ' Read less',
                moreStyle: TextStyle(
                  fontSize: Responsive.getWidth(context) * 0.038,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary, // Color for the "Read more" text
                ),
                lessStyle: TextStyle(
                  fontSize: Responsive.getWidth(context) * 0.038,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary, // Color for the "Read less" text
                ),
                style: TextStyle(
                  fontFamily: 'Semibold',
                  fontSize: Responsive.getWidth(context) * 0.038,
                  color: TColors.darkerGrey,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
