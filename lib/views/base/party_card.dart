import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_networked_image.dart';
import 'package:neoterra/views/screens/common/party_details.dart';
import 'package:neoterra/views/screens/organizer/management/organizer_management.dart';

class PartyCard extends StatelessWidget {
  final int seed;
  final double radius;
  final bool isHost;
  const PartyCard({
    super.key,
    required this.seed,
    this.radius = 24,
    this.isHost = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isHost) {
          Get.to(() => OrganizerManagement());
        } else {
          Get.to(() => PartyDetails());
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(radius),
        child: Container(
          decoration: BoxDecoration(color: AppColors.card),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: CustomNetworkedImage(
                  url: "https://picsum.photos/seed/$seed/500/500",
                  radius: 0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Party Title",
                      textAlign: TextAlign.start,
                      style: AppTexts.dxsb,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      spacing: 4,
                      children: [
                        CustomSvg(asset: "assets/icons/pin.svg"),
                        Text(
                          "Location of party",
                          textAlign: TextAlign.start,
                          style: AppTexts.tsmm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 4,
                      children: [
                        CustomSvg(asset: "assets/icons/calendar.svg"),
                        Text(
                          "Friday, May 12",
                          textAlign: TextAlign.start,
                          style: AppTexts.tsmm,
                        ),
                        Spacer(),
                        CustomSvg(asset: "assets/icons/clock.svg"),
                        Text(
                          "9:00 PM",
                          textAlign: TextAlign.start,
                          style: AppTexts.tsmm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 4,
                      children: [
                        CustomSvg(asset: "assets/icons/calendar.svg"),
                        Text(
                          "\$150",
                          textAlign: TextAlign.start,
                          style: AppTexts.dxss,
                        ),
                        Spacer(),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
