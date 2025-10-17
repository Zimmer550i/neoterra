import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_networked_image.dart';
import 'package:neoterra/views/screens/common/party_details.dart';
import 'package:neoterra/views/screens/common/qr.dart';

class PartyCardCompact extends StatelessWidget {
  final int seed;
  final bool joined;
  final bool ended;
  const PartyCardCompact({
    super.key,
    required this.seed,
    this.joined = false,
    this.ended = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PartyDetails());
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: Row(
          spacing: 12,
          children: [
            CustomNetworkedImage(
              url: "https://picsum.photos/seed/$seed/500/500",
              radius: 8,
              height: 86,
              width: 86,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Party Title",
                            textAlign: TextAlign.start,
                            style: AppTexts.tlgs,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            spacing: 4,
                            children: [
                              CustomSvg(asset: "assets/icons/pin.svg"),
                              Text(
                                "Location of party",
                                textAlign: TextAlign.start,
                                style: AppTexts.txsm.copyWith(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomSvg(
                            asset: "assets/icons/fire.svg",
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    spacing: 4,
                    children: [
                      CustomSvg(asset: "assets/icons/calendar.svg"),
                      Text(
                        "Friday, May 12",
                        textAlign: TextAlign.start,
                        style: AppTexts.txsm.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Spacer(),
                      ended
                          ? Container(height: 24,)
                          : joined
                          ? GestureDetector(
                              onTap: () {
                                Get.to(() => Qr());
                              },
                              child: CustomSvg(
                                asset: "assets/icons/qr.svg",
                                color: AppColors.mint,
                              ),
                            )
                          : Text(
                              "\$150",
                              textAlign: TextAlign.start,
                              style: AppTexts.dxss,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
