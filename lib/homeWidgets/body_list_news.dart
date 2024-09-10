import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexus_news/homeWidgets/popular_news.dart';
import 'package:nexus_news/utils/constants/responsive.dart';


class ListOfNews extends StatelessWidget {
  const ListOfNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: Responsive.getWidth(context)>=600? 200 : 105,
      ),
      itemBuilder: (context, index) {
        return const PopularNews();
      },
    );
  }
}


