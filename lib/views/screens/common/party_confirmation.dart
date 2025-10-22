import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_confirmation.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/common/qr.dart';

class PartyConfirmation extends StatelessWidget {
  const PartyConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Confirmation"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomSvg(asset: "assets/icons/tick_circle.svg"),
              const SizedBox(height: 24),
              Text(
                "You’re locked in!",
                style: AppTexts.dmds.copyWith(color: AppColors.mint),
              ),
              const SizedBox(height: 54),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "House Nation",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 32,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.mint,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            spacing: 4,
                            children: [
                              Text("2", style: AppTexts.tsmm),
                              Text("ticket", style: AppTexts.txsm),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Fri. March 21, 2025",
                            style: TextStyle(color: AppColors.secondaryText),
                          ),
                        ),
                        Text(
                          "\$300",
                          style: AppTexts.txlm.copyWith(color: AppColors.mint),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        CustomSvg(
                          asset: "assets/icons/pin.svg",
                          size: 24,
                          color: Colors.white,
                        ),
                        Text(
                          "The Downtown Club",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      onTap: () {
                        Get.to(() => Qr());
                      },
                      text: "Show QR",
                      padding: 32,
                      width: null,
                      leading: "assets/icons/qr.svg",
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                          ),
                          border: Border(
                            right: BorderSide(color: AppColors.mint),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvg(
                              asset: "assets/icons/add_to_calender.svg",
                              size: 24,
                            ),
                            const SizedBox(width: 4),
                            Text("Add to Calendar", style: AppTexts.txss),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvg(
                              asset: "assets/icons/share.svg",
                              size: 24,
                            ),
                            const SizedBox(width: 4),
                            Text("Share This Event", style: AppTexts.txss),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showConfirmation(
                        context: context,
                        title: "Cancel?",
                        description: "Are you sure you want to cancel?",
                        confirmText: "Yes, Cancel",
                        cancelText: "No",
                        onConfirm: () {
                          // Add logout logic here
                        },
                        onCancel: () {
                          // Optional: add cancel logic here
                        },
                      );
                    },
                    child: Text("Cancel?", style: AppTexts.tlgm),
                  ),
                  Spacer(),
                  CustomButton(
                    onTap: () {
                      Get.back();
                      Get.back();
                      Get.back();
                    },
                    text: "Explore More",
                    width: null,
                    padding: 16,
                    isSecondary: true,
                    leading: "assets/icons/search.svg",
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
