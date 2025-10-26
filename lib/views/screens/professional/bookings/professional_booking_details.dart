import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/show_confirmation.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/common/chat.dart';
import 'package:neoterra/views/screens/professional/bookings/professional_booking_confirmation.dart';
import 'package:neoterra/views/screens/professional/home/professional_booking_form.dart';
import 'package:neoterra/views/screens/user/profile/user_info.dart';

class ProfessionalBookingDetails extends StatelessWidget {
  final bool isAccepted;
  const ProfessionalBookingDetails({super.key, this.isAccepted = false});

  @override
  Widget build(BuildContext context) {
    return ProfessionalBookingForm(
      title: "Request Booking",
      isEditable: false,
      actions: Row(
        children: [
          Expanded(
            child: isAccepted
                ? CustomButton(
                    onTap: () => showConfirmation(
                      title: "Cancel",
                      description: "Do you really want to cancel the booking?",
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
                    color: AppColors.coral,
                  )
                : CustomButton(
                    onTap: () => showConfirmation(
                      title: "Decline",
                      description: "Do you really want to decline the request?",
                      confirmText: "Yes, do it",
                      cancelText: "No",
                      onConfirm: () {
                        Get.back();
                      },
                      onCancel: () {},
                      context: context,
                    ),
                    text: "Decline",
                    isSecondary: true,
                    color: AppColors.coral,
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: isAccepted
                ? CustomButton(
                    onTap: () {
                      Get.to(() => Chat());
                    },
                    text: "Message",
                    isSecondary: true,
                    color: AppColors.mint,
                  )
                : CustomButton(
                    onTap: () {
                      Get.to(
                        () => UserInfo(
                          title: "Booking Policies",
                          data: "",
                          confirmation: () {
                            Get.to(() => ProfessionalBookingConfirmation());
                          },
                        ),
                      );
                    },
                    text: "Accept",
                    color: AppColors.coral,
                  ),
          ),
        ],
      ),
    );
  }
}
