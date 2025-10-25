import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_button.dart';

class ProfessionalBookingConfirmation extends StatelessWidget {
  final bool bookingAccepted;
  const ProfessionalBookingConfirmation({
    super.key,
    this.bookingAccepted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: "Confirmation"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            CustomSvg(asset: "assets/icons/tick_circled_filled.svg"),
            const SizedBox(height: 24),
            Text(
              bookingAccepted ? "Booking Accepted!" : "You are all set!",
              style: AppTexts.dsms,
            ),
            const SizedBox(height: 24),
            Text(
              "Your offer has been submitted. DJ Sonica will review your rwquest and respond shortly. You’ll be notified once they accept or decline.",
              style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Event Name", style: AppTexts.tlgb),
                  Text(
                    "Name of the Event",
                    style: AppTexts.tsmr.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const SizedBox(width: double.infinity),
                  Text("Location", style: AppTexts.tlgb),
                  Text(
                    "Location of the Event",
                    style: AppTexts.tsmr.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const SizedBox(),
                  Text("Price", style: AppTexts.tlgb),
                  Text(
                    "\$800",
                    style: AppTexts.tsmr.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              onTap: () {},
              text: "Add Callendar",
              isSecondary: true,
            ),
            const SizedBox(height: 8),
            CustomButton(
              onTap: () {
                Get.until(
                  (route) => route.settings.name == '/professional_app',
                );
              },
              text: "Goto Home",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
