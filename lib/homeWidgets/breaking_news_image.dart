import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/news_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    super.key, required this.imageUrl, required this.headlines,
  });
  final String imageUrl;
  final String headlines;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>const NewsDetail());
      },
      child: Container(
        height: Responsive.getHeight(context) * 0.30,
        width: double.infinity,
        decoration: BoxDecoration(
          color: TColors.light,
          borderRadius: BorderRadius.circular(Responsive.getWidth(context)>600?24:12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Responsive.getWidth(context)>600?24:12),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: Responsive.getHeight(context) * 0.08,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 25,
                right: 25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Responsive.getHeight(context) * 0.040,
                        width: Responsive.getWidth(context)*0.22,
                        decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Recomended",
                            style: TextStyle(
                              color: TColors.white,
                              fontFamily: 'Regular',
                              fontSize: Responsive.getWidth(context) *
                                  0.03,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        headlines,
                        style: TextStyle(
                          color: TColors.white,
                          fontFamily: 'Semibold',
                          fontSize: Responsive.getWidth(context) * 0.04,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
