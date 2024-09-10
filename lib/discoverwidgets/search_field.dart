import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width >= 600? Responsive.getWidth(context) * 0.5 : Responsive.getWidth(context),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
                hintText: "Type to search...",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontFamily: 'Regular',
                ),
                prefixIcon: const Icon(
                  Iconsax.search_normal,
                  color: TColors.iconPrimary,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear_all_rounded,
                    color: TColors.iconPrimary,
                  ),
                  onPressed: () {
                    // Clear the text field or perform another action
                  },
                ),
                fillColor: TColors.light,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: TColors.light,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: TColors.grey,
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
              cursorColor: TColors.primary,
              onChanged: (value) {
                // Handle text changes
              },
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.sort_down,color: TColors.white,)),),
        ),
      ],
    );
  }
}
