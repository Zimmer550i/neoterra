import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/show_confirmation.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/professional/bookings/professional_booking_confirmation.dart';
import 'package:neoterra/views/screens/professional/home/professional_booking_form.dart';

class ProfessionalOfferAccepted extends StatelessWidget {
  const ProfessionalOfferAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              size: 128,
            ),
            const SizedBox(height: 24),
            Text("Offer Accepted!", style: AppTexts.dsms),
            const SizedBox(height: 24),
            Text(
              "Your offer has been submitted. DJ Sonica will review your rwquest and respond shortly. You’ll be notified once they accept or decline.",
              style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomButton(
              onTap: () {
                Get.to(
                  () => ProfessionalBookingForm(
                    title: "Complete Booking",
                    isEditable: false,
                    actions: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () => showConfirmation(
                              title: "Cancel",
                              description:
                                  "Do you really want to cancel the booking?",
                              confirmText: "Yes, do it",
                              cancelText: "No",
                              onConfirm: () {
                                Get.back();
                              },
                              onCancel: () {},
                              context: context,
                            ),
                            text: "Cancel",
                            isSecondary: true,
                            secondaryColor: AppColors.coral,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              Get.to(
                                () => ProfessionalBookingConfirmation(
                                  bookingAccepted: true,
                                ),
                              );
                            },
                            padding: 0,
                            text: "Confirm & Pay",
                            secondaryColor: AppColors.coral,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              text: "Confirm Booking",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
