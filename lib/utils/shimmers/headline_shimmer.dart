import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

import '../constants/colors.dart';
import '../constants/responsive.dart';


class HeadlineShimmer extends StatelessWidget {
  const HeadlineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11,vertical: 12),
      height: Responsive.getHeight(context) * 0.30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: TColors.light,
        borderRadius: BorderRadius.circular(Responsive.getWidth(context) > 600 ? 24 : 12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Responsive.getWidth(context) > 600 ? 24 : 12),
        child: Stack(
          children: [
            // Shimmer effect added here
            Positioned(
              bottom: 0,
              left: 25,
              right: 25,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: TColors.primary.withOpacity(0.1),
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: Responsive.getHeight(context) * 0.030,
                        width: Responsive.getWidth(context) * 0.22,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: Responsive.getHeight(context) * 0.020,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: Responsive.getHeight(context) * 0.020,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "",
                            style: TextStyle(
                              color: TColors.white,
                              fontFamily: 'Regular',
                              fontSize: Responsive.getWidth(context) * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

