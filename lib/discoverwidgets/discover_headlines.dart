import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/repos/news_repo.dart';
import '../utils/constants/colors.dart';

class DiscoverHeadlines extends StatelessWidget {
  DiscoverHeadlines({super.key});

  final List<String> discoverList = ['Bitcoin', 'Politics', 'Climate', 'Science', 'Education'];

  @override
  Widget build(BuildContext context) {
    Get.put(NewsRepo());

    return SizedBox(
      height: 160,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 8),
        scrollDirection: Axis.horizontal,
        itemCount: discoverList.length, 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                height: 160,
                width: 130,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1pBppR.img?w=768&h=512&m=6',
                        fit: BoxFit.cover,
                        height: 160,
                        width: 130,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50, 
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              TColors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Headline text, dynamically showing the title from discoverList
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          discoverList[index], // Display dynamic title
                          style: const TextStyle(
                            color: TColors.white,
                            fontFamily: 'Semibold',
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
