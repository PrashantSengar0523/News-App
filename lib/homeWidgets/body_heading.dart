import 'package:flutter/material.dart';

import '../utils/constants/responsive.dart';

class BodyHeading extends StatelessWidget {
  const BodyHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "  Popular",
      style: TextStyle(
        fontFamily: 'Semibold',
        fontSize: Responsive.getWidth(context) * 0.045,
      ),
    );
  }
}