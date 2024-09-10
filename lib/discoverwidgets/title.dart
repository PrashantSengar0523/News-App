import 'package:flutter/material.dart';

import '../utils/constants/responsive.dart';

class TTitle extends StatelessWidget {
  const TTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Walk with Trend",
      style: TextStyle(
          fontFamily: 'Bold',
          fontSize: Responsive.getWidth(context) * 0.060),
    );
  }
}
