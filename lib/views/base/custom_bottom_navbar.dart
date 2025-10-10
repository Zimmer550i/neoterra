import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int)? onChanged;
  const CustomBottomNavbar({super.key, required this.index, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: AppColors.secondaryBg),
      child: BottomNavigationBar(
        onTap: onChanged,
        currentIndex: index,
        selectedLabelStyle: AppTexts.txss.copyWith(color: AppColors.mint),
        selectedItemColor: AppColors.mint,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: CustomSvg(asset: "assets/icons/home.svg"),
            activeIcon: CustomSvg(asset: "assets/icons/home_active.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(asset: "assets/icons/search.svg"),
            activeIcon: CustomSvg(asset: "assets/icons/search_active.svg"),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(asset: "assets/icons/role_switch.svg"),
            activeIcon: CustomSvg(asset: "assets/icons/role_switch_active.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(asset: "assets/icons/tickets.svg"),
            activeIcon: CustomSvg(asset: "assets/icons/tickets_active.svg"),
            label: "Tickets",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(asset: "assets/icons/profile.svg"),
            activeIcon: CustomSvg(asset: "assets/icons/profile_active.svg"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
