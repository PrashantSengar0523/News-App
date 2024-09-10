import 'package:flutter/material.dart';

import '../utils/constants/responsive.dart';
class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Don't stay behind, discover and read the trend",
      style: TextStyle(
          fontFamily: 'Semibold',
          fontSize: Responsive.getWidth(context) * 0.045),
    );
  }
}