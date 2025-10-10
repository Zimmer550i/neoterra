import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/custom_svg.dart';

class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasMoreOptions;
  const HomeBar({super.key, required this.hasMoreOptions});

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
            const SizedBox(width: 20),
            CustomSvg(asset: "assets/icons/logo.svg"),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (hasMoreOptions) {
                  Get.context!.findRootAncestorStateOfType<ScaffoldState>();
                  Scaffold.of(context).openDrawer();
                } else {}
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: hasMoreOptions
                        ? AppColors.gray.shade400
                        : AppColors.mint,
                  ),
                ),
                child: Center(
                  child: CustomSvg(
                    asset:
                        "assets/icons/${hasMoreOptions ? "more" : "bell"}.svg",
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
