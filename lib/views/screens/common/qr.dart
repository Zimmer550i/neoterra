import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatelessWidget {
  const Qr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "QR"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                "Party Name",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Total Paid",
                style: AppTexts.txlm.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 4),
              Text(
                "\$150",
                style: AppTexts.dxss.copyWith(color: AppColors.mint),
              ),
              const SizedBox(height: 16),
              Text(
                "Friday, April 21 2025 • 10:30 PM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "The Downtown Club",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: QrImageView(
                  data: "Fu*c Neoterra, Fu*c Edwynnx, Fu*c Fiverr",
                  size: 140,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 48),
              CustomButton(
                onTap: () {
                  Get.back();
                },
                text: "Get Back",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
