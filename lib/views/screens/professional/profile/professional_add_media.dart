import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';

class ProfessionalAddMedia extends StatelessWidget {
  const ProfessionalAddMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Media"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            children: [
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
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomSvg(asset: "assets/icons/upload.svg"),
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
              ),
              const SizedBox(height: 24),
              CustomTextField(title: "Name"),
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
