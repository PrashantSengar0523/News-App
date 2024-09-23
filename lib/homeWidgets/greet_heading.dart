

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_news/repos/user_repo.dart';
import '../models/user_model.dart';
import '../utils/constants/responsive.dart';
import '../utils/constants/shimmer.dart';

class GreetHeading extends StatelessWidget {


  const GreetHeading({super.key,});

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(UserRepo());
    return Row(
      children: [
        Text(
          "${getGreetingMessage()},",
          style: TextStyle(
            fontFamily: 'Bold',
            fontSize: Responsive.getWidth(context) * 0.045,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        FutureBuilder<UserModel>(
          future: UserRepo.instance.retrieveUserRecord(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: PShimmer(
                height: 10,
                width: Responsive.getWidth(context) * 0.095,
              ));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              return Text(
                "${user.name} !",
                style: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: Responsive.getWidth(context) * 0.045,
                ),
              );
            } else {
              return const Center(child: Text(''));
            }
          },
        ),
      ],
    );
  }
}
