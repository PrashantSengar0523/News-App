import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/homeWidgets/greet_heading.dart';
import 'package:nexus_news/homeWidgets/sub_heading.dart';
import 'package:nexus_news/repos/news_repo.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import 'package:nexus_news/utils/constants/sizes.dart';
import '../drawer/custom_drawer.dart';
import '../homeWidgets/body_list_news.dart';
import '../homeWidgets/promo_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewsRepo());
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        backgroundColor: TColors.white, // Keep this static
        elevation: 0, // Set elevation to 0 to avoid shadow effects
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    // color: TColors.primary,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset('assets/images/nexus-logo.png'),
              ),
              Flexible(
                child: SizedBox(
                  width: Responsive.getWidth(context) * 0.5,
                  height: 38,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Iconsax.search_normal,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: TColors.lightGrey,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 11.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                icon: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Iconsax.element_35,
                    size: 18,
                    color: TColors.white,
                  ),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              GreetHeading(),
              SubTitle(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Top Headlines----->
              TSliders(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// News---->
              ListOfNews(),
            ],
          ),
        ),
      ),
    );
  }
}
