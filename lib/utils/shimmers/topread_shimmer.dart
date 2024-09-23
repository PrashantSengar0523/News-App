import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';

class TopreadShimmer extends StatelessWidget {
  const TopreadShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10), // Space between items
      decoration: BoxDecoration(
        color: TColors.light,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: Responsive.getHeight(context) * 0.20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: TColors.white),
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity, // Adjust width as needed
                height: Responsive.getWidth(context) *
                    0.025, // Adjust height as needed
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: TColors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: Responsive.getWidth(context) *
                    0.7, // Adjust width as needed
                height: Responsive.getWidth(context) *
                    0.025, // Adjust height as needed
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: TColors.white),
              ),
            ),
          ),
          const SizedBox(height: 8), // Add spacing between text and row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: Responsive.getWidth(context) * 0.25,
                        height: Responsive.getWidth(context) * 0.025,
                        decoration: BoxDecoration(
                            color: TColors.grey,
                            borderRadius: BorderRadius.circular(
                                16)), // Placeholder color
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8,),
                 Expanded(
                  child: Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: Responsive.getWidth(context) * 0.25,
                          height: Responsive.getWidth(context) * 0.025,
                          decoration: BoxDecoration(
                              color: TColors.grey,
                              borderRadius: BorderRadius.circular(
                                  16)), // Placeholder color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
