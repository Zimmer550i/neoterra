import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';
import 'package:neoterra/views/screens/auth/login.dart';

class ResetPassword extends StatefulWidget {
  final bool isResettingPass;
  const ResetPassword({super.key, this.isResettingPass = false});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final newPass = TextEditingController();
  final conPass = TextEditingController();

  void onConfirm() async {
    Get.offAll(() => Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Reset Password"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Password",
              style: AppTexts.dxss.copyWith(color: AppColors.mint),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              title: "New Password",
              leading: "assets/icons/lock.svg",
              hintText: "Enter new password",
              isPassword: true,
              controller: newPass,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: "Confirm Password",
              leading: "assets/icons/lock.svg",
              hintText: "Re-enter your password",
              isPassword: true,
              controller: conPass,
            ),
            const SizedBox(height: 40),
            CustomButton(text: "Confirm", onTap: onConfirm),
          ],
        ),
      ),
    );
  }
}
