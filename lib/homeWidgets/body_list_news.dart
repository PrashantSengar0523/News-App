import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexus_news/homeWidgets/body_heading.dart';
import 'package:nexus_news/homeWidgets/popular_news.dart';
import '../utils/constants/sizes.dart';


class ListOfNews extends StatelessWidget {
  const ListOfNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyHeading(),
        SizedBox(
                height: TSizes.spaceBtwItems,
              ),
        PopularNews()
      ],
    );
  }
}


