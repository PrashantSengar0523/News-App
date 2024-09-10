import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/screens/news_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class PopularNews extends StatelessWidget {
  const PopularNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>const NewsDetail());
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                Responsive.getWidth(context) >= 768 ? 16 : 12),
            child: CachedNetworkImage(
              imageUrl:
                  'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1pBppR.img?w=768&h=512&m=6',
              height: Responsive.getHeight(context) >= 600 ? 165 : 90,
              width: Responsive.getWidth(context) * 0.31,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Text(
                  "India's Covid Crises Needs a New Lockdown",
                  style: TextStyle(
                    color: TColors.black,
                    fontFamily: 'Bold',
                    fontSize: Responsive.getWidth(context) * 0.04,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      flex: 2, // Adjust the flex value to control space distribution
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Iconsax.profile,
                              size:
                                  Responsive.getWidth(context) >= 600 ? 28 : 18,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              'By Jane Smith',
                              style: TextStyle(
                                color: TColors.black,
                                fontFamily: 'Semibold',
                                fontSize:
                                    Responsive.getWidth(context) * 0.029,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1, // Adjust the flex value to control space distribution
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.clock,
                            size:
                                Responsive.getWidth(context) >= 600 ? 22 : 12,
                          ),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              '10 min read',
                              style: TextStyle(
                                color: TColors.black,
                                fontFamily: 'Semibold',
                                fontSize:
                                    Responsive.getWidth(context) * 0.029,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bookmark,
                  size: Responsive.getWidth(context) >= 600 ? 36 : 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
