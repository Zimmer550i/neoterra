import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/common/party_confirmation.dart';

class JoinParty extends StatelessWidget {
  const JoinParty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Join Event"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Select number of tickets", style: AppTexts.txlm),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  Container(
                    width: 52,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBg,
                      border: Border(
                        top: BorderSide(color: AppColors.mint),
                        left: BorderSide(color: AppColors.mint),
                        bottom: BorderSide(color: AppColors.mint),
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: CustomSvg(asset: "assets/icons/minus.svg"),
                    ),
                  ),
                  Text("2", style: AppTexts.dsmm),
                  Container(
                    width: 52,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBg,
                      border: Border(
                        top: BorderSide(color: AppColors.mint),
                        right: BorderSide(color: AppColors.mint),
                        bottom: BorderSide(color: AppColors.mint),
                      ),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: CustomSvg(asset: "assets/icons/plus.svg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text("2 tickets × \$150 =", style: AppTexts.tmdr),
              Text(
                "\$300.00",
                style: AppTexts.dlgs.copyWith(color: AppColors.mint),
              ),
              Spacer(),
              CustomButton(
                onTap: () {
                  Get.to(() => PartyConfirmation());
                },
                text: "Confirm",
                leading: "assets/icons/tick.svg",
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
