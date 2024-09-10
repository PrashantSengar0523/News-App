import 'package:flutter/material.dart';
import 'package:nexus_news/screens/signup_form.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';

import 'login_form.dart';

class Auth extends StatelessWidget {
  final ValueNotifier<bool> isLogin = ValueNotifier(true);

  Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Welcome to Nexus News",
                style: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: Responsive.getWidth(context) * 0.055,
                  color: TColors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Stay informed with the latest news tailored for you.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Regular',
                  fontSize: Responsive.getWidth(context) * 0.045,
                  color: TColors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: isLogin,
                  builder: (context, isLoginForm, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isLogin.value = true;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: isLoginForm
                                    ? TColors.primary
                                    : TColors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize:
                                        Responsive.getWidth(context) * 0.035,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Regular',
                                    color:
                                        isLoginForm ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isLogin.value = false;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: !isLoginForm
                                    ? TColors.primary
                                    : TColors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize:
                                        Responsive.getWidth(context) * 0.035,
                                    fontFamily: 'Regular',
                                    fontWeight: FontWeight.bold,
                                    color: !isLoginForm
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder<bool>(
                valueListenable: isLogin,
                builder: (context, isLoginForm, child) {
                  return isLoginForm
                      ? const LoginForm()
                      : const SignupForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


