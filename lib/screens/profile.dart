import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/screens/edit_profile.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import 'package:nexus_news/utils/constants/sizes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            children: [
              Center(
                  child: Text("Profile",
                      style: TextStyle(
                        fontFamily: 'Bold',
                        fontSize: Responsive.getWidth(context) * 0.06,
                      ))),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Responsive.getWidth(context)>600?30:20),
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        height: Responsive.getWidth(context)>600?140:70,
                        width: Responsive.getWidth(context)>600?140:70,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text("Aditya Rajput",
                          style: TextStyle(
                            fontFamily: 'Semibold',
                            fontSize: Responsive.getWidth(context) * 0.045,
                          )),
                      Text("Student",
                          style: TextStyle(
                              fontFamily: 'Regular',
                              fontSize: Responsive.getWidth(context) * 0.042,
                              color: TColors.darkerGrey)),
                  
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Expanded(child: IconButton(onPressed: (){
                    Get.to(()=>const EditProfile());
                  }, icon: Icon(Iconsax.edit,color: TColors.iconPrimary,size: Responsive.getWidth(context)*0.06,)))
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Container(
                padding: const EdgeInsets.all(TSizes.lg),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TColors.transparent.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(
                      Responsive.getWidth(context) * 0.02),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Activity",
                      style: TextStyle(
                          fontFamily: 'Semibold',
                          fontSize: Responsive.getWidth(context) * 0.05),
                    ),
                    const SizedBox(
                      height: TSizes.defaultSpace,
                    ),
                    for (int i = 0; i < 3; i++)
                      Row(
                        children: [
                          Icon(Iconsax.book,size: Responsive.getWidth(context)*0.06,color: TColors.iconPrimary,),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Read " +
                                      "'India's covid crises needs a new Lockdown'",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontFamily: 'Medium',
                                      fontSize:
                                          Responsive.getWidth(context) * 0.04),
                                ),
                                Text(
                                  "2 hours ago",
                                  style: TextStyle(
                                      fontFamily: 'Regular',
                                      fontSize:
                                          Responsive.getWidth(context) * 0.03),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Container(
                padding: const EdgeInsets.all(TSizes.sm),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Center(child: Text("Logout",style: TextStyle(fontFamily: 'Bold',fontSize: Responsive.getWidth(context)*0.048,color: TColors.white),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
