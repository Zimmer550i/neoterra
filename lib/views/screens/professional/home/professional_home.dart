import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_custom_calendar.dart';
import 'package:neoterra/views/base/custom_networked_image.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/professional/profile/professional_profile.dart';

class ProfessionalHome extends StatefulWidget {
  const ProfessionalHome({super.key});

  @override
  State<ProfessionalHome> createState() => _ProfessionalHomeState();
}

class _ProfessionalHomeState extends State<ProfessionalHome> {
  List<int> selectedTabs = [];
  List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 4,
              children: [
                for (int i = 0; i < AppConstants.vibes.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedTabs.contains(i)) {
                          selectedTabs.remove(i);
                        } else {
                          selectedTabs.add(i);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mint),
                        color: selectedTabs.contains(i)
                            ? AppColors.mint
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        AppConstants.vibes.elementAt(i).name,
                        style: AppTexts.txsm.copyWith(
                          color: selectedTabs.contains(i)
                              ? null
                              : AppColors.mint,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text("Featured Pros", style: AppTexts.tmds),
              Spacer(),
              GestureDetector(
                onTap: () => showCustomCalendar(context, selectedDates, (date) {
                  setState(() {
                    if (selectedDates.contains(date)) {
                      selectedDates.remove(date);
                    } else {
                      selectedDates.add(date);
                    }
                  });
                }),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: selectedDates.isEmpty
                        ? AppColors.mint
                        : AppColors.coral,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    spacing: 4,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/calendar.svg",
                        color: Colors.white,
                        size: 16,
                      ),
                      Text("Calendar", style: AppTexts.txsm),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 10; i++)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProfessionalProfile());
                    },
                    child: Column(
                      children: [
                        ProfilePicture(
                          image: "https://thispersondoesnotexist.com",
                          size: 72,
                          borderColor: AppColors.mint,
                          borderWidth: 2,
                        ),
                        Text("Name", style: AppTexts.tmdm),
                        Text(
                          "DJ",
                          style: AppTexts.tmdr.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // CustomButton(text: "Book", width: null, isSecondary: true),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 4),
                  for (int i = 0; i < 10; i++)
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfessionalProfile());
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.card,
                        ),
                        child: Row(
                          children: [
                            CustomNetworkedImage(
                              url: "https://picsum.photos/500/500",
                              height: 102,
                              width: 102,
                              radius: 8,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name of DJ", style: AppTexts.tlgs),
                                  Text("DJ", style: AppTexts.txsm),
                                  Text(
                                    "Bringing 10+ years of energy to the nightlife scene. Expert at creating .....",
                                    style: AppTexts.txsr.copyWith(
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
