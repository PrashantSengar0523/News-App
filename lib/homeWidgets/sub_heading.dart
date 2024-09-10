import 'package:flutter/material.dart';

import '../utils/constants/responsive.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Stay ahead with today's headlines.",
      style: TextStyle(
        fontFamily: 'Regular',
        fontSize: Responsive.getWidth(context) * 0.042,
      ),
    );
  }
}
