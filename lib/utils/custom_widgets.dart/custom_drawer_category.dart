import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/drawer_controller.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';

class CustomDrawerCategory extends StatelessWidget {
  const CustomDrawerCategory({
    super.key, required this.category, required this.icon,
  });
  final String category;
  final IconData icon; 
  @override
  Widget build(BuildContext context) {
    return Consumer<TDrawerController>(
      builder: (context, drawerController, child) {
        return GestureDetector(
          onTap: () {
            drawerController.selectCategory(category);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: drawerController.selectedCategory == category
                    ? TColors.primary.withOpacity(0.2)
                    : TColors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: drawerController.selectedCategory == category
                      ? TColors.primary
                      : TColors.iconPrimary,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(category,
                    style: TextStyle(
                      fontFamily: 'Bold',
                      fontSize: Responsive.getWidth(context) * 0.045,
                      color: drawerController.selectedCategory == category
                          ? TColors.primary
                          : TColors.darkerGrey,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
