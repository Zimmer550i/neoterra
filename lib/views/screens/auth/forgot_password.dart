import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';
import 'package:neoterra/views/screens/auth/otp_verification.dart';

class ForgotPassword extends StatefulWidget {
  final String? phone;
  const ForgotPassword({super.key, this.phone});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    phone.text = widget.phone ?? "";
  }

  void onSent() async {
    Get.to(() => OtpVerification(isResettingPass: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Forgot Password"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "Forgot Your Password?",
                    style: AppTexts.dxss.copyWith(color: AppColors.mint),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "No worries! Let’s get you back in",
                    textAlign: TextAlign.center,
                    style: AppTexts.txlm.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              title: "Phone",
              controller: phone,
              leading: "assets/icons/phone.svg",
              hintText: "Enter your phone number",
            ),
            const SizedBox(height: 24),
            CustomButton(onTap: onSent, text: "Send OTP"),
          ],
        ),
      ),
    );
  }
}
