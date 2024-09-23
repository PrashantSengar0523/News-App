import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/controllers/verify_email_controller.dart';
import 'package:nexus_news/repos/authentication_repo.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VerifyEmailController());
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        backgroundColor: TColors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          AuthenticationRepo.instance.logoutUser();
        }, icon: const Icon(CupertinoIcons.clear)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/bubble-gum-message-sent.png'),
              const SizedBox(height: 10,),
              Text("Verify your Email Address",style: TextStyle(fontFamily: 'Bold',fontSize: Responsive.getWidth(context)*0.060,color: TColors.black)),
              const SizedBox(height: 15,),
              Text("support@gmail.com",style: TextStyle(fontFamily: 'Semibold',fontSize: Responsive.getWidth(context)*0.038,color: TColors.darkerGrey)),
              const SizedBox(height: 15,),
              Text("Congratulations! Your account is ready. Verify your email to unlock a world of news and exploration..",textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Regular',fontSize: Responsive.getWidth(context)*0.032,color: TColors.darkGrey)),
              const SizedBox(height: 30,),
              InkWell(
                onTap: () {
                    controller.emailVerificationStatus();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Continue",style: TextStyle(fontFamily: 'Medium',fontSize: Responsive.getWidth(context)*0.04,color: TColors.white))),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  controller.sendEmailVerifyLink();
                },
                child: Text("Resend Email",style: TextStyle(fontFamily: 'Regular',fontSize: Responsive.getWidth(context)*0.035,color: TColors.primary),))
            ],
          ),
        ),
      ),
    );
  }
}