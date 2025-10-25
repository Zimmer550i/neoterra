import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_drop_down.dart';

class OrganizerAddStory extends StatelessWidget {
  const OrganizerAddStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text("Add Story", style: AppTexts.dlgb),
              const SizedBox(height: 8),
              Text(
                "Upload a photo or 15-sec\nvideo from your camera roll.",
                style: AppTexts.tmdr,
              ),
              const SizedBox(height: 24),
              CustomDropDown(
                title: "Category",
                hintText: "Select category",
                options: AppConstants.vibes.map((e) => e.name).toList(),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Image", style: AppTexts.tlgs),
              ),
              const SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomSvg(
                                asset: "assets/icons/upload.svg",
                                color: AppColors.mint,
                                size: 36,
                              ),
                              Text(
                                "Select file",
                                style: AppTexts.tmdr.copyWith(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 1,
                        color: AppColors.secondaryText,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomSvg(
                                asset: "assets/icons/camera.svg",
                                color: AppColors.mint,
                                size: 36,
                              ),
                              Text(
                                "Capture",
                                style: AppTexts.tmdr.copyWith(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                onTap: () {
                  Get.back();
                },
                text: "Upload",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
