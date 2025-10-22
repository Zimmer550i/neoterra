import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
