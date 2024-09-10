import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import '../utils/custom_widgets.dart/custom_drawer_category.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current date
    String currentDate = DateFormat('MMM d, yyyy').format(DateTime.now());
    // Format the current time
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/images/nexus-logo.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "News",
                    style: TextStyle(
                      fontFamily: 'Bold',
                      fontSize: Responsive.getWidth(context) * 0.07,
                      color: TColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                currentDate,
                style: TextStyle(
                  fontFamily: 'Semibold',
                  fontSize: Responsive.getWidth(context) * 0.05,
                  color: TColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                currentTime,
                style: TextStyle(
                  fontFamily: 'Medium',
                  fontSize: Responsive.getWidth(context) * 0.04,
                  color: TColors.darkerGrey,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(height: 16),

              // Inside the CustomDrawer widget:

// Home
              const CustomDrawerCategory(
                category: 'Home',
                icon: Iconsax.home_15,
              ),
              const SizedBox(height: 16),
// Sports
              const CustomDrawerCategory(
                category: 'Sports',
                icon: Iconsax.activity5,
              ),
              const SizedBox(height: 16),
// Business
              const CustomDrawerCategory(
                category: 'Business',
                icon: Iconsax.chart_15,
              ),
              const SizedBox(height: 16),
// Education
              const CustomDrawerCategory(
                category: 'Education',
                icon: Icons.school,
              ),
              const SizedBox(height: 16),
// Technology
              const CustomDrawerCategory(
                category: 'Technology',
                icon: Iconsax.devices_14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
