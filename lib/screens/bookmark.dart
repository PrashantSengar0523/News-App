import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/discoverwidgets/search_field.dart';
import 'package:nexus_news/screens/news_detail.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import 'package:nexus_news/utils/constants/sizes.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Saved Articles",
                  style: TextStyle(
                    fontFamily: 'Semibold',
                    fontSize: Responsive.getWidth(context) * 0.06,
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SearchField(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=>const NewsDetail());
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: TColors.light,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1pWSeZ.img?w=768&h=432&m=6&x=332&y=155&s=271&d=271',
                          fit: BoxFit.cover,
                          height:125,
                          width: Responsive.getWidth(context) * 0.35,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Modi govt gives absolute powers to Delhi L-G to constitute, appoint members of boards, panels; notification issued",
                              style: TextStyle(
                                fontFamily: 'Bold',
                                fontSize: Responsive.getWidth(context) * 0.035,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 4,
                            ),
                            
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Published At",
                                    style: TextStyle(
                                      fontFamily: 'Light',
                                      fontSize:
                                          Responsive.getWidth(context) * 0.032,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Icon(CupertinoIcons.arrow_turn_up_right,
                                    size: Responsive.getWidth(context) * 0.04),
                                const SizedBox(
                                  width: TSizes.defaultSpace,
                                ),
                                Icon(
                                  CupertinoIcons.bookmark_fill,
                                  size: Responsive.getWidth(context) * 0.04,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
