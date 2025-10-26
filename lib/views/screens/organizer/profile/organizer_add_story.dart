import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_drop_down.dart';
import 'package:neoterra/views/base/image_picker_widget.dart';

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
              ImagePickerWidget(),
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
