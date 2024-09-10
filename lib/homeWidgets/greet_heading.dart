import 'package:flutter/material.dart';

import '../utils/constants/responsive.dart';

class GreetHeading extends StatelessWidget {
  const GreetHeading({super.key});
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
    return Text(
                "${getGreetingMessage()}, Prashant !",
                style: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: Responsive.getWidth(context) * 0.045,
                ),
              );
  }
}