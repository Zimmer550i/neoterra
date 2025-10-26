import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';

class OrganizerExportGuestlist extends StatefulWidget {
  const OrganizerExportGuestlist({super.key});

  @override
  State<OrganizerExportGuestlist> createState() =>
      _OrganizerExportGuestlistState();
}

class _OrganizerExportGuestlistState extends State<OrganizerExportGuestlist> {
  int? filter;
  int? format;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Export Guestlist"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text("Filter", style: AppTexts.txlm),
              options("All Guests", filter == 0, () {
                setState(() {
                  filter = 0;
                });
              }),
              options("Only checked-in", filter == 1, () {
                setState(() {
                  filter = 1;
                });
              }),
              options("Only not checked-in", filter == 2, () {
                setState(() {
                  filter = 2;
                });
              }),
              const SizedBox(height: 24),
              Text("Format", style: AppTexts.tlgs),
              options("PDF", format == 0, () {
                setState(() {
                  format = 0;
                });
              }),
              options("Excel", format == 1, () {
                setState(() {
                  format = 1;
                });
              }),
              options("SVG", format == 2, () {
                setState(() {
                  format = 2;
                });
              }),

              const SizedBox(height: 40),
              CustomTextField(
                title: "Send to",
                hintText: "Enter your email address",
              ),
              const SizedBox(height: 40),
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
                      text: "Export",
                      padding: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(String title, bool value, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 16,
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: value ? AppColors.mint : AppColors.gray.shade500,
                ),
              ),
              child: value
                  ? Center(
                      child: Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mint,
                        ),
                      ),
                    )
                  : Container(),
            ),
            Text(title, style: AppTexts.tlgr),
          ],
        ),
      ),
    );
  }
}
