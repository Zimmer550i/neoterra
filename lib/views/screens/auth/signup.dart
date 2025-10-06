import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';
import 'package:neoterra/views/screens/auth/login.dart';
import 'package:neoterra/views/screens/auth/otp_verification.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final pass = TextEditingController();
  final conPass = TextEditingController();

  void onSubmit() async {
    Get.to(() => OtpVerification());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              CustomSvg(asset: "assets/icons/logo.svg"),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Create an account to get started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                title: "Name",
                controller: name,
                leading: "assets/icons/user.svg",
                hintText: "Enter your name",
              ),
              const SizedBox(height: 24),
              CustomTextField(
                title: "Email",
                controller: email,
                leading: "assets/icons/mail.svg",
                hintText: "Enter your email",
              ),
              const SizedBox(height: 24),
              CustomTextField(
                title: "Phone",
                controller: phone,
                leading: "assets/icons/phone.svg",
                hintText: "Enter your Phone",
              ),
              const SizedBox(height: 24),
              CustomTextField(
                title: "Password",
                controller: pass,
                isPassword: true,
                leading: "assets/icons/lock.svg",
                hintText: "Create a password",
              ),
              const SizedBox(height: 24),
              CustomTextField(
                title: "Confirm Password",
                controller: conPass,
                isPassword: true,
                leading: "assets/icons/lock.svg",
                hintText: "Re-enter your password",
              ),
              const SizedBox(height: 40),
              CustomButton(onTap: onSubmit, text: "Sign Up"),
              Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTexts.txsm.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => Login());
                    },
                    child: Text(
                      " Log in",
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
