import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigation_menu.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';


class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Username",
          style: TextStyle(
              fontFamily: 'Semibold',
              fontSize: Responsive.getWidth(context) * 0.045),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Enter your full name',
            labelStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric( horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: TColors.primary, width: 2),
            ),
          ),
          style: const TextStyle(color: Colors.black87),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          " Email",
          style: TextStyle(
              fontFamily: 'Semibold',
              fontSize: Responsive.getWidth(context) * 0.045),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Enter your email',
            labelStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric( horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: TColors.primary, width: 2),
            ),
          ),
          style: const TextStyle(color: Colors.black87),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          " Password",
          style: TextStyle(
              fontFamily: 'Semibold',
              fontSize: Responsive.getWidth(context) * 0.045),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Create password',
            labelStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric( horizontal: 15),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.remove_red_eye_rounded,color: TColors.iconPrimary,)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: TColors.primary, width: 2),
            ),
          ),
          
          style: const TextStyle(color: Colors.black87),
        ),
        const SizedBox(height: 15,),
        Row(children: [
          Container(
            margin: const EdgeInsets.only(left: 4),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              border: Border.all(color: TColors.primary),
              borderRadius: BorderRadius.circular(4)
            ),
          ),
          SizedBox(width: Responsive.getWidth(context)*0.03,),
          Expanded(child: Text('I agree to Terms of Services and Privacy policy',overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontFamily: 'Light',fontSize: Responsive.getWidth(context)*0.035,fontWeight: FontWeight.bold),))
        ],),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(()=>const NavigationMenu());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              shadowColor: Colors.black, 
              elevation: 5, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11), 
              ),
              animationDuration:
                  const Duration(milliseconds: 200), 
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Semibold',
                fontSize: Responsive.getWidth(context)*0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        

      ],
    );
  }
}
