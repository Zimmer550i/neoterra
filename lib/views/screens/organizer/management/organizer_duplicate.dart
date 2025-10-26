import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';

class OrganizerDuplicate extends StatefulWidget {
  const OrganizerDuplicate({super.key});

  @override
  State<OrganizerDuplicate> createState() => _OrganizerDuplicateState();
}

class _OrganizerDuplicateState extends State<OrganizerDuplicate> {
  final ctrl = TextEditingController(text: "Event Name (Copy)");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Duplicate Event"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            CustomTextField(controller: ctrl),
            const SizedBox(height: 60),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    text: "Cancel",
                    padding: 0,
                    color: AppColors.card,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    text: "Duplicate",
                    padding: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
