import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';

class OrganizerAnalytics extends StatelessWidget {
  const OrganizerAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          IntrinsicWidth(
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.mint,
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.charcoal,
                  shape: BoxShape.circle,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Column(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("\$12,000", style: AppTexts.dmdm),
                      Text(
                        "Total Revenue",
                        style: AppTexts.txsr.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 68,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray.shade400),
              ),
            ),
            child: Row(
              children: [
                Text("Total Tickets Sold:", style: AppTexts.tmds),
                Spacer(),
                Text("1,250", style: AppTexts.tmds),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    " Tickets",
                    style: AppTexts.txsr.copyWith(
                      color: AppColors.gray.shade100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 68,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray.shade400),
              ),
            ),
            child: Row(
              children: [
                Text("Event Attendance:", style: AppTexts.tmds),
                Spacer(),
                Text("340", style: AppTexts.tmds),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    " Guests",
                    style: AppTexts.txsr.copyWith(
                      color: AppColors.gray.shade100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 68,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray.shade400),
              ),
            ),
            child: Row(
              children: [
                Text("Top Performing Event:", style: AppTexts.tmds),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("AfroVibe Night", style: AppTexts.tmds),
                    Text(
                      "– 650 tickets sold",
                      style: AppTexts.txsr.copyWith(
                        color: AppColors.gray.shade100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 68,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray.shade400),
              ),
            ),
            child: Row(
              children: [
                Text("Most Profitable Event:", style: AppTexts.tmds),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("AfroVibe Night", style: AppTexts.tmds),
                    Text(
                      "– \$5,200 revenue",
                      style: AppTexts.txsr.copyWith(
                        color: AppColors.gray.shade100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 68,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray.shade400),
              ),
            ),
            child: Row(
              children: [
                Text("Average Ticket Price:", style: AppTexts.tmds),
                Spacer(),
                Text("\$18.5", style: AppTexts.tmds),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    "",
                    style: AppTexts.txsr.copyWith(
                      color: AppColors.gray.shade100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 68,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray.shade400),
              ),
            ),
            child: Row(
              children: [
                Text("Cancellations:", style: AppTexts.tmds),
                Spacer(),
                Text("5%", style: AppTexts.tmds),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    " Cancelled",
                    style: AppTexts.txsr.copyWith(
                      color: AppColors.gray.shade100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
