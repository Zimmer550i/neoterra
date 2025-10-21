import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';

class ProfessionalEarnings extends StatelessWidget {
  const ProfessionalEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Earnings & Payout"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                "Total Earning",
                style: AppTexts.dsmr.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 8),
              Text("\$2,500", style: AppTexts.dxls),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Remaining Payout",
                      style: AppTexts.txlr.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("\$1,200", style: AppTexts.dmdb),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              CustomButton(onTap: () {}, text: "Withdraw Earning"),
              const SizedBox(height: 48),
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Payouts",
                    style: AppTexts.dsmr.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  for (int i = 0; i < 12; i++)
                    Row(
                      children: [
                        Text("Apr 20", style: AppTexts.dsmr),
                        Spacer(),
                        Text("\$800", style: AppTexts.dsmr),
                      ],
                    ),
                ],
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
