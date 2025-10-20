import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_custom_calendar.dart';
import 'package:neoterra/views/base/party_card_compact.dart';

class UserExplore extends StatefulWidget {
  const UserExplore({super.key});

  @override
  State<UserExplore> createState() => _UserExploreState();
}

class _UserExploreState extends State<UserExplore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.card.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              spacing: 8,
              children: [
                CustomSvg(
                  asset: "assets/icons/search.svg",
                  color: AppColors.secondaryText.withValues(alpha: 0.8),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: AppTexts.tmdm.copyWith(
                        color: AppColors.secondaryText.withValues(alpha: 0.8),
                      ),
                    ),
                    cursorColor: AppColors.mint,
                    style: AppTexts.tmdm,
                  ),
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
                for (int i = 0; i < 10; i++)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text("Tag ${i + 1}", style: AppTexts.txsm),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              GestureDetector(
                onTap: () => showCustomCalendar(context, (dates) {}, (date) {}),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.mint,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    spacing: 4,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/calendar.svg",
                        color: Colors.white,
                        size: 20,
                      ),
                      Text("Calender", style: AppTexts.tmdm),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomSvg(
                asset: "assets/icons/pin.svg",
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text("Location", style: AppTexts.tmdm),
              const SizedBox(width: 4),
              CustomSvg(
                asset: "assets/icons/arrow_down.svg",
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 50; i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: PartyCardCompact(seed: i),
                    ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
