import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_icons.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  const CustomAppBar({super.key, required this.title, this.hasLeading = true});

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.charcoal,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: 64,
        child: Row(
          children: [
            SizedBox(width: 14),
            InkWell(
              onTap: () => hasLeading ? Get.back() : null,
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 32,
                width: 32,
                child: hasLeading
                    ? Center(child: CustomSvg(asset: AppIcons.back))
                    : const SizedBox(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTexts.tmds,
              ),
            ),
            const SizedBox(width: 12),
            const SizedBox(width: 32),
            const SizedBox(width: 14),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(
          height: 1,
          width: double.infinity,
          color: AppColors.gray.shade600,
        ),
      ),
    );
  }
}
