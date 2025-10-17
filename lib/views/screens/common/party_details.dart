import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_networked_image.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/common/join_party.dart';
import 'package:neoterra/views/screens/common/profile_list.dart';

class PartyDetails extends StatelessWidget {
  const PartyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Event Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(24),
                child: Container(
                  decoration: BoxDecoration(color: AppColors.card),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: CustomNetworkedImage(radius: 0),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 12,
                          vertical: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sat. Mar 21, 2025",
                                  style: AppTexts.tsmr.copyWith(
                                    color: AppColors.gray[25],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  height: 2,
                                  width: 1,
                                  color: AppColors.gray[25],
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "02:00pm - 02:00am",
                                  style: AppTexts.tsmr.copyWith(
                                    color: AppColors.gray[25],
                                  ),
                                ),
                                Spacer(),
                                CustomSvg(asset: "assets/icons/unsaved.svg"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text("Indie Music Night", style: AppTexts.dsms),
                            const SizedBox(height: 12),
                            Text(
                              "Vibes for the indie music lover in you. Don’t miss out on an electric night of live performances!",
                              style: AppTexts.tsmr.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/eye.svg",
                                  size: 16,
                                  color: AppColors.secondaryText,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "100+",
                                  style: AppTexts.tsmr.copyWith(
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                CustomSvg(
                                  asset: "assets/icons/unsaved.svg",
                                  size: 16,
                                  color: AppColors.secondaryText,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "50+",
                                  style: AppTexts.tsmr.copyWith(
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.to(
                                  () => ProfileList(
                                    title: "Guest List",
                                    callBack: () async {
                                      await Future.delayed(
                                        Duration(seconds: 2),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text("Guest List", style: AppTexts.tmdm),
                                  Spacer(),
                                  SizedBox(
                                    width: 24 + (16 * 5) + 2,
                                    height: 26,
                                    child: Stack(
                                      children: [
                                        for (int i = 1; i < 6; i++)
                                          Positioned(
                                            left: (16 * i).toDouble(),
                                            child: ProfilePicture(
                                              image:
                                                  "https://thispersondoesnotexist.com",
                                              size: 24,
                                              borderColor: Colors.white,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "+5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "See all",
                                    style: AppTexts.txss.copyWith(
                                      color: AppColors.mint,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.coral,
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Row(
                                    spacing: 4,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomSvg(asset: "assets/icons/fire.svg"),
                                      Text(
                                        "Trending",
                                        textAlign: TextAlign.start,
                                        style: AppTexts.tsmm,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Hosted by: Sean John",
                                  style: AppTexts.tmdr.copyWith(
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/pin.svg",
                                  size: 24,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    "The Downtown Club, 20 West Street, New York, NY 10004",
                                    style: AppTexts.tsmm,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "\$150",
                    style: AppTexts.dsmm.copyWith(color: AppColors.mint),
                  ),
                  Spacer(),
                  CustomButton(
                    onTap: () {
                      Get.to(() => JoinParty());
                    },
                    text: "Join Party",
                    width: 150,
                    padding: 0,
                    leading: "assets/icons/plus.svg",
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
