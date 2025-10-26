import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/party_card.dart';
import 'package:neoterra/views/screens/organizer/dashboard/organizer_party_list.dart';
import 'package:neoterra/views/screens/organizer/dashboard/organizer_ticketing.dart';
import 'package:neoterra/views/screens/organizer/profile/organizer_add_story.dart';
import 'package:neoterra/views/screens/organizer/profile/organizer_manage_story.dart';

class OrganizerDashboard extends StatelessWidget {
  const OrganizerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Get.to(() => OrganizerPartyList());
            },
            child: Row(
              children: [
                Text("Your Events", style: AppTexts.tmds),
                Spacer(),
                Text(
                  "See All",
                  style: AppTexts.txsm.copyWith(color: AppColors.coral),
                ),
                const SizedBox(width: 4),
                CustomSvg(
                  asset: "assets/icons/arrow_right.svg",
                  color: AppColors.coral,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              spacing: 12,
              children: [
                for (int i = 0; i < 5; i++)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: PartyCard(seed: i, radius: 12, isHost: true),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            onTap: () {
              Get.to(() => OrganizerTicketing());
            },
            text: "Create New Event",
            leading: "assets/icons/plus.svg",
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              Get.to(() => OrganizerAddStory());
            },
            text: "Upload Story",
            color: AppColors.coral,
            leading: "assets/icons/plus.svg",
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Guest List", style: AppTexts.tmds),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            decoration: BoxDecoration(
              color: AppColors.secondaryBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ticket Sells",
                      style: AppTexts.tsmr.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    Text("430", style: AppTexts.dxss),
                  ],
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Revenue",
                      style: AppTexts.tsmr.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    Text("\$12,450", style: AppTexts.dxss),
                  ],
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
          GestureDetector(
            onTap: () {
              Get.to(() => OrganizerManageStory());
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              decoration: BoxDecoration(
                color: AppColors.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _engagementItem("24", "Uploaded"),
                  _engagementItem("1073", "Views"),
                  _engagementItem("35%", "Engage"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _engagementItem(String value, String label) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: AppTexts.txls),
        Text(
          label,
          style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
        ),
      ],
    );
  }
}
