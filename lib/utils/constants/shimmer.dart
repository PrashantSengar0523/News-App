import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class PShimmer extends StatelessWidget {
  const PShimmer({super.key, this.height=10, this.width=120});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 11),
        width: width, // Adjust the width to fit the small box size
        height: height, // Adjust the height to fit the small box size
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
      ),
    );
  }
}
