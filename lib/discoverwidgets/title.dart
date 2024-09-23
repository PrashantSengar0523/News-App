import 'package:flutter/material.dart';

import '../utils/constants/responsive.dart';

class TTitle extends StatelessWidget {
  const TTitle({
    super.key, this.title,
  });
final String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title??'',
      style: TextStyle(
          fontFamily: 'Bold',
          fontSize: Responsive.getWidth(context) * 0.060),
    );
  }
}
