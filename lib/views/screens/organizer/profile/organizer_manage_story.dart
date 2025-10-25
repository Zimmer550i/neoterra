import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';

class OrganizerManageStory extends StatelessWidget {
  const OrganizerManageStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Stories"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("See Your Stories", style: AppTexts.tlgs),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i in AppConstants.vibes)
                    SizedBox(
                      width: 76,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.mint),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(99),
                              child: Image.asset(i.iconImage),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            i.name,
                            maxLines: 2,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Story Engagement", style: AppTexts.tlgs),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: AppColors.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _engagementItem("24", "Uploaded"),
                  _engagementItem("1073", "Views"),
                  _engagementItem("35%", "Engage"),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              onTap: () {
                
              },
              text: "Add Story",
              leading: "assets/icons/plus.svg",
            ),
          ],
        ),
      ),
    );
  }

  Widget _engagementItem(String value, String label) {
    return Expanded(
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value, style: AppTexts.txls),
          Text(
            label,
            style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }
}
