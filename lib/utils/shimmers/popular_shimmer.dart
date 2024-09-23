import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/responsive.dart';
import '../constants/colors.dart';

class PopularShimmer extends StatelessWidget {
  const PopularShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
      height: Responsive.getWidth(context) * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: TColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for image
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: TColors.grey, // Placeholder color
                height: Responsive.getWidth(context) * 0.25,
                width: Responsive.getWidth(context) * 0.30,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder for title
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: Responsive.getWidth(context) * 0.028,
                    decoration: BoxDecoration(
                      color: TColors.grey,
                      borderRadius: BorderRadius.circular(16)
                    ), // Placeholder color
                  ),
                ),
                const SizedBox(height: 8),
                // Placeholder for subtitle line 1
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: Responsive.getWidth(context) * 0.028,
                    decoration: BoxDecoration(
                      color: TColors.grey,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Placeholder for subtitle line 2
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: Responsive.getWidth(context) * 0.4,
                    height: Responsive.getWidth(context) * 0.028,
                    decoration: BoxDecoration(
                      color: TColors.grey,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Placeholder for author
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 4),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: Responsive.getWidth(context) * 0.2,
                              height: Responsive.getWidth(context) * 0.028,
                              decoration: BoxDecoration(
                                color: TColors.grey,
                      borderRadius: BorderRadius.circular(16)
                    ), // Placeholder color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
