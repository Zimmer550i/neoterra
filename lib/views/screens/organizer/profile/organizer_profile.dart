import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/party_card_compact.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/organizer/profile/organizer_manage_story.dart';

class OrganizerProfile extends StatelessWidget {
  final bool isUser;
  const OrganizerProfile({super.key, this.isUser = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isUser ? null : CustomAppBar(title: "View Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  ProfilePicture(
                    image: "https://thispersondoesnotexist.com",
                    size: 60,
                    borderColor: AppColors.mint,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text("Organizer Name", style: AppTexts.txls)),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: CustomSvg(asset: "assets/icons/tiktok_button.svg"),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: CustomSvg(asset: "assets/icons/insta_button.svg"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("About", style: AppTexts.tlgs),
              ),
              const SizedBox(height: 4),
              Text(
                "Bringing 10+ years of energy to the nightlife scene. Expert at creating unforgettable party vibes with Afrobeat and EDM mixes",
                style: AppTexts.txsr.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Get.to(() => OrganizerManageStory());
                },
                child: Row(
                  children: [
                    Text("Story", style: AppTexts.tmds),
                    Spacer(),
                    Text("Manage", style: AppTexts.txsm),
                    const SizedBox(width: 4),
                    CustomSvg(
                      asset: "assets/icons/arrow_right.svg",
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
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
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Events", style: AppTexts.tlgs),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PartyCardCompact(seed: index + 1);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
