import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/controllers/signup_controller.dart';
import 'package:nexus_news/utils/validators/validation.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
   Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username Field
          Text(
            " Username",
            style: TextStyle(
                fontFamily: 'Semibold',
                fontSize: Responsive.getWidth(context) * 0.045),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.nameController,
            validator: (value) => TValidator.validateEmptyText('Name', value),
            decoration: InputDecoration(
              labelText: 'Enter your full name',
              labelStyle: const TextStyle(color: Colors.black54),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
            controller: controller.emaiController,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: 'Enter your email',
              labelStyle: const TextStyle(color: Colors.black54),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.togglepassword.value,
              decoration: InputDecoration(
                labelText: 'Create password',
                labelStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.togglepassword.value =
                        !controller.togglepassword.value;
                  },
                  icon: controller.togglepassword.value
                      ? const Icon(Iconsax.eye_slash,
                          color: TColors.iconPrimary)
                      : const Icon(Icons.remove_red_eye_rounded,
                          color: TColors.iconPrimary),
                ),
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
                  borderSide:
                      const BorderSide(color: TColors.primary, width: 2),
                ),
              ),
              style: const TextStyle(color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Obx(
                () => SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (bool? value) {
                      controller.privacyPolicy.value = value ?? false;
                    },
                    activeColor:
                        TColors.primary, 
                    checkColor: TColors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          4), 
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Responsive.getWidth(context) * 0.03,
              ),
              Expanded(
                child: Text(
                  'I agree to Terms of Services and Privacy policy',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'Light',
                    fontSize: Responsive.getWidth(context) * 0.035,
                    fontWeight: FontWeight.bold,
                    color: TColors.darkerGrey
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.primary,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                animationDuration: const Duration(milliseconds: 200),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Semibold',
                  fontSize: Responsive.getWidth(context) * 0.045,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
