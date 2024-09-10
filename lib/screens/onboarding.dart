import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/screens/auth.dart';
import 'package:nexus_news/utils/constants/colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/nexus-logo.png',
                height: screenHeight * 0.20,
                width: screenWidth * 0.50,
              ),
              const SizedBox(height: 20,),
              Text(
                "Welcome to Nexus News",
                style: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: screenWidth * 0.065,
                  color: TColors.white,
                ),
              ),
              Text(
                'Get the latest headlines, tailored just for you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Regular',
                  fontSize: screenWidth * 0.055,
                  color: TColors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            color: TColors.secondary, shape: BoxShape.circle)),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Access news around the world',
                      style: TextStyle(
                        fontFamily: 'Regular',
                        fontSize: screenWidth * 0.045,
                        color: TColors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            color: TColors.secondary, shape: BoxShape.circle)),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Stay tuned on major events',
                      style: TextStyle(
                        fontFamily: 'Regular',
                        fontSize: screenWidth * 0.045,
                        color: TColors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            color: TColors.secondary, shape: BoxShape.circle)),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Discover what's popular",
                      style: TextStyle(
                        fontFamily: 'Regular',
                        fontSize: screenWidth * 0.045,
                        color: TColors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.11,
              ),
              InkWell(
                onTap: () {
                  Get.to(()=>Auth());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: TColors.light,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(
                            color: TColors.primary,
                            fontFamily: 'Bold',
                            fontSize: screenWidth * 0.045,
                            shadows: const [
                              Shadow(
                                blurRadius: 3.0,
                                color: TColors.darkGrey,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Reduced space between text and icon
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: TColors.primary,
                        ),
                      ],
                    ),
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
