import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_calendar.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/professional/profile/professional_availability_calendar.dart';
import 'package:neoterra/views/screens/professional/profile/professional_photos_and_videos.dart';

class ProfessionalProfile extends StatelessWidget {
  final bool isUser;
  const ProfessionalProfile({super.key, this.isUser = false});

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
                  Expanded(
                    child: Text("Professional Name", style: AppTexts.txls),
                  ),
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
              const SizedBox(height: 16),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomButton(
                      leading: "assets/icons/tick_circle.svg",
                      text: "Request Booking",
                      padding: 0,
                      isSecondary: true,
                      secondaryColor: AppColors.mint,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      leading: "assets/icons/message.svg",
                      text: "Message",
                      padding: 0,
                      isSecondary: true,
                      secondaryColor: AppColors.coral,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About",
                  style: AppTexts.tlgs.copyWith(color: AppColors.mint),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Bringing 10+ years of energy to the nightlife scene. Expert at creating unforgettable party vibes with Afrobeat and EDM mixes",
                style: AppTexts.txsr.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    spacing: 12,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/work.svg",
                        color: AppColors.mint,
                        size: 24,
                      ),
                      Text("DJ", style: AppTexts.tmdm),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/pin.svg",
                        color: AppColors.mint,
                        size: 24,
                      ),
                      Text("New York City", style: AppTexts.tmdm),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/review.svg",
                        color: AppColors.mint,
                        size: 24,
                      ),
                      Text("4.5 (120 reviews)", style: AppTexts.tmdm),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/price.svg",
                        color: AppColors.mint,
                        size: 24,
                      ),
                      Text("From \$500", style: AppTexts.tmdm),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Get.to(() => ProfessionalPhotosAndVideos());
                },
                child: Row(
                  children: [
                    Text("Photos & Videos", style: AppTexts.tmds),
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
                  spacing: 16,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        padding: EdgeInsets.all(8),
                        width:
                            (MediaQuery.of(context).size.width - 40) / 2 - 16,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.vertical(
                                top: Radius.circular(16),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  "assets/images/hiphop.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text("Mix Audio", style: AppTexts.tlgs),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Review", style: AppTexts.tmds),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                controller: ScrollController(
                  initialScrollOffset: MediaQuery.of(context).size.width - 100,
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        padding: EdgeInsets.all(12),
                        width: (MediaQuery.of(context).size.width - 100),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.mint),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ProfilePicture(
                                  image: "https://thispersondoesnotexist.com",
                                  size: 44,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    "User Name",
                                    style: AppTexts.tmds,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Amazing energy! Kept the crowd hyped all night",
                              style: AppTexts.tmdr.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/review.svg",
                                  size: 16,
                                  color: AppColors.coral,
                                ),
                                const SizedBox(width: 4),
                                Text("4.5", style: AppTexts.txsm),
                                Spacer(),
                                Text("April 15", style: AppTexts.txsm),
                              ],
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
                child: Text("Availability Calendar", style: AppTexts.tmds),
              ),
              const SizedBox(height: 16),
              CustomCalendar(
                onDateSelected: (val) {},
                selectedDates: [
                  DateTime.now(),
                  DateTime.now().add(Duration(days: 1)),
                  DateTime.now().add(Duration(days: 2)),
                  DateTime.now().add(Duration(days: 3)),
                  DateTime.now().add(Duration(days: 7)),
                  DateTime.now().add(Duration(days: 8)),
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                onTap: () {
                  Get.to(() => ProfessionalAvailabilityCalendar());
                },
                text: "Manage Calendar",
                isSecondary: true,
                secondaryColor: AppColors.mint,
                width: null,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
