import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/controllers/login_controller.dart';
import 'package:nexus_news/screens/forgot_password.dart';
import 'package:nexus_news/utils/validators/validation.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/responsive.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              validator: (value) => TValidator.validateEmptyText('Password', value),
              obscureText: controller.togglepassword.value,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                labelStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.togglepassword.value =
                        !controller.togglepassword.value;
                  },
                  icon: Icon(
                    controller.togglepassword.value
                        ? Iconsax.eye_slash
                        : Icons.remove_red_eye_rounded,
                    color: TColors.iconPrimary,
                  ),
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
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.login();
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
                'Login',
                style: TextStyle(
                  fontFamily: 'Semibold',
                  fontSize: Responsive.getWidth(context) * 0.040,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Get.to(() => const ForgotPassword());
              },
              child: Center(
                  child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontFamily: 'Regular',
                    fontSize: Responsive.getWidth(context) * 0.045,
                    color: TColors.primary),
                textAlign: TextAlign.end,
              ))),
        ],
      ),
    );
  }
}
