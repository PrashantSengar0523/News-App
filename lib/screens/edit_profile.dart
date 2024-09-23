import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/screens/edit_profile_field.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';

import '../models/user_model.dart';
import '../repos/user_repo.dart';
import '../utils/constants/shimmer.dart';
import '../utils/custom_widgets.dart/custom_dialog_box.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: Responsive.getWidth(context) * 0.048,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("Profile",
                      style: TextStyle(
                        fontFamily: 'Bold',
                        fontSize: Responsive.getWidth(context) * 0.05,
                      )),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          Responsive.getWidth(context) > 600 ? 30 : 20),
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        height: Responsive.getWidth(context) > 600 ? 140 : 70,
                        width: Responsive.getWidth(context) > 600 ? 140 : 70,
                      ),
                    ),
                    Positioned(
                      bottom: -8,
                      right: -8,
                      child: CircleAvatar(
                        radius: Responsive.getWidth(context) > 600 ? 20 : 15,
                        backgroundColor: TColors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: Responsive.getWidth(context) > 600 ? 20 : 15,
                            color: TColors.iconPrimary,
                          ),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Edit profile picture",
                  style: TextStyle(
                      fontFamily: 'Medium',
                      fontSize: Responsive.getWidth(context) * 0.03,
                      color: TColors.primary)),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Personal Information",
                      style: TextStyle(
                          fontFamily: 'Bold',
                          fontSize: Responsive.getWidth(context) * 0.04,
                          color: TColors.black))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name",
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.darkerGrey)),
                          FutureBuilder<UserModel>(
                        future: UserRepo.instance.retrieveUserRecord(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: PShimmer(
                              height: 10,
                              width: Responsive.getWidth(context) * 0.085,
                            ));
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong!'));
                          } else if (snapshot.hasData) {
                            final user = snapshot.data!;
                            return Text(user.name,
                                style: TextStyle(
                          fontFamily: 'Semibold',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.black));
                          } else {
                            return const Center(
                                child: Text(''));
                          }
                        },
                      ),
                
                  IconButton(
                      onPressed: () {
                        Get.to(()=>const EditProfilefilds());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: TColors.iconPrimary,
                        size: Responsive.getWidth(context) * 0.04,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profession",
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.darkerGrey)),
                  Text("Student",
                      style: TextStyle(
                          fontFamily: 'Semibold',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.black)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: TColors.iconPrimary,
                        size: Responsive.getWidth(context) * 0.04,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email",
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.darkerGrey)),
                            FutureBuilder<UserModel>(
                        future: UserRepo.instance.retrieveUserRecord(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: PShimmer(
                              height: 10,
                              width: Responsive.getWidth(context) * 0.085,
                            ));
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong!'));
                          } else if (snapshot.hasData) {
                            final user = snapshot.data!;
                            return Text(user.email,
                      style: TextStyle(
                          fontFamily: 'Semibold',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.black));
                          } else {
                            return const Center(
                                child: Text(''));
                          }
                        },
                      ),
                  
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: TColors.iconPrimary,
                        size: Responsive.getWidth(context) * 0.04,
                      ))
                ],
              ),
                          const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("User Id",
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: Responsive.getWidth(context) * 0.035,
                          color: TColors.darkerGrey)),
                  FutureBuilder<UserModel>(
                        future: UserRepo.instance.retrieveUserRecord(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: PShimmer(
                              height: 10,
                              width: Responsive.getWidth(context) * 0.085,
                            ));
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong!'));
                          } else if (snapshot.hasData) {
                            final user = snapshot.data!;
                            return Text(user.id,
                      style: TextStyle(
                          fontFamily: 'Semibold',
                          fontSize: Responsive.getWidth(context) * 0.032,
                          color: TColors.black));
                          } else {
                            return const Center(
                                child: Text(''));
                          }
                        },
                      ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.copy,
                        color: TColors.iconPrimary,
                        size: Responsive.getWidth(context) * 0.04,
                      ))
                ],
              ),
             const Divider(),
             const SizedBox(height: 20,),
             InkWell(
              onTap: () {
                showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox(
                            text:
                                "Are you sure you want to permanently delete your account?",
                            onCancelPressed: () {
                              Get.back();
                            },
                            onConfirmPressed: () {
                              // controller.deleteUser();
                              Get.back();
                            },
                          );
                        },
                      );
              },
               child: Container(
                width: Responsive.getWidth(context)/2.8,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: TColors.primary,
                ),
                child: Center(child: Text("Delete Account",style: TextStyle(fontFamily: 'Semibold',fontSize: Responsive.getWidth(context)*0.035,color: TColors.textWhite)),),
               ),
             ) 
            ],
          ),
        ),
      ),
    );
  }
}





