import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';

enum NotificationType { soft, hard, completed, decision, remindLater }

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.item,
    required this.showBoarder,
  });

  final Map<String, dynamic> item;
  final bool showBoarder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      decoration: BoxDecoration(
        border: showBoarder
            ? Border(bottom: BorderSide(color: AppColors.gray.shade400))
            : null,
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.card,
            ),
            child: Center(
              child: CustomSvg(
                asset: "assets/icons/bell.svg",
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: AppTexts.tsms),
                Text(
                  item['text'],
                  style: AppTexts.txsm.copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
