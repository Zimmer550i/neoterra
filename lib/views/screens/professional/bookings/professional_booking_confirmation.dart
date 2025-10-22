import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/common/chat.dart';

class ProfessionalBookingConfirmation extends StatelessWidget {
  const ProfessionalBookingConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Booking Confirmation"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text("Request Sent\nto DJ Sonica", style: AppTexts.dsmm),
              const SizedBox(height: 24),
              ProfilePicture(
                image: "https://thispersondoesnotexist.com",
                borderColor: AppColors.mint,
                borderWidth: 2,
              ),
              const SizedBox(height: 24),
              Text(
                "Your offer has been submitted. DJ Sonica will review your rwquest and respond shortly. You’ll be notified once they accept or decline.",
                textAlign: TextAlign.center,
                style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        CustomSvg(
                          asset: "assets/icons/work.svg",
                          color: AppColors.mint,
                          size: 24,
                        ),
                        Text(
                          DateFormat(
                            "MMMM dd, yyy hh:mm a",
                          ).format(DateTime.now()),
                          style: AppTexts.tmdm,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        CustomSvg(
                          asset: "assets/icons/pin.svg",
                          color: AppColors.mint,
                          size: 24,
                        ),
                        Text("New York City", style: AppTexts.tmdm),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        CustomSvg(
                          asset: "assets/icons/review.svg",
                          color: AppColors.mint,
                          size: 24,
                        ),
                        Text("4.5 (120 reviews)", style: AppTexts.tmdm),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        CustomSvg(
                          asset: "assets/icons/price.svg",
                          color: AppColors.mint,
                          size: 24,
                        ),
                        Text("From \$500", style: AppTexts.tmdm),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Get.back();
                      },
                      text: "Modify Request",
                      padding: 0,
                      isSecondary: true,
                      secondaryColor: AppColors.coral,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Get.to(() => Chat());
                      },
                      text: "Message",
                      padding: 0,
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
