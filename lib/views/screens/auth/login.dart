import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';
import 'package:neoterra/views/screens/app/user_app.dart';
import 'package:neoterra/views/screens/auth/forgot_password.dart';
import 'package:neoterra/views/screens/splash/find_your_vibes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phone = TextEditingController();
  final pass = TextEditingController();
  String? loading;

  void onSubmit() async {
    Get.to(() => UserApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvg(asset: "assets/icons/logo.svg"),
              const SizedBox(height: 32),
              CustomTextField(
                title: "Phone",
                controller: phone,
                leading: "assets/icons/phone.svg",
                hintText: "Enter your phone number",
              ),
              const SizedBox(height: 24),
              CustomTextField(
                title: "Password",
                controller: pass,
                leading: "assets/icons/lock.svg",
                isPassword: true,
                hintText: "Enter your Password",
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.to(() => ForgotPassword(phone: phone.text));
                  },
                  child: Text(
                    "Forget password?",
                    style: AppTexts.txsm.copyWith(color: AppColors.coral),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                onTap: onSubmit,
                isLoading: loading == "loading",
                text: "Sign In",
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  "or, continue with",
                  style: AppTexts.tmdr.copyWith(color: AppColors.secondaryText),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.mint),
                      ),
                      child: Center(
                        child: loading == "google"
                            ? CircularProgressIndicator(color: AppColors.mint)
                            : CustomSvg(asset: "assets/icons/google.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.mint),
                      ),
                      child: Center(
                        child: loading == "facebook"
                            ? CircularProgressIndicator(color: AppColors.mint)
                            : CustomSvg(asset: "assets/icons/facebook.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.mint),
                      ),
                      child: Center(
                        child: loading == "apple"
                            ? CircularProgressIndicator(color: AppColors.mint)
                            : CustomSvg(asset: "assets/icons/apple.svg"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First time on Neoterra?",
                    style: AppTexts.txsm.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => FindYourVibes());
                    },
                    child: Text(
                      " Create your vibe",
                      style: AppTexts.txss.copyWith(color: AppColors.coral),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
