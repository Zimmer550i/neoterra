import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/auth/login.dart';
import 'package:neoterra/views/screens/auth/reset_password.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  final bool isResettingPass;
  const OtpVerification({super.key, this.isResettingPass = false});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final otp = TextEditingController();

  void onVerify() async {
    if (widget.isResettingPass) {
      Get.to(() => ResetPassword());
    } else {
      Get.offAll(() => Login());
    }
  }

  void onResend() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "OTP Verification"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verify Phone Number",
              style: AppTexts.dxss.copyWith(color: AppColors.mint),
            ),
            const SizedBox(height: 32),
            Pinput(
              length: 6,
              controller: otp,
              defaultPinTheme: PinTheme(
                width: (MediaQuery.of(context).size.width - 40) / 7,
                height: (MediaQuery.of(context).size.width - 40) / 7,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  shape: BoxShape.circle,
                ),
                textStyle: AppTexts.txlm,
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(text: "Verify", onTap: onVerify),
            const SizedBox(height: 8),
            Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t get the code?",
                  style: AppTexts.txsm.copyWith(color: AppColors.secondaryText),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    " Resend",
                    style: AppTexts.txss.copyWith(color: AppColors.coral),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
