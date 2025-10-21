import 'package:flutter/material.dart';
import 'package:neoterra/models/user.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int)? onChanged;
  final Role role;
  const CustomBottomNavbar({
    super.key,
    required this.index,
    this.onChanged,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    var professionalItems = [
      BottomNavigationBarItem(
        icon: CustomSvg(asset: "assets/icons/home.svg"),
        activeIcon: CustomSvg(asset: "assets/icons/home_active.svg"),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: CustomSvg(asset: "assets/icons/booking.svg"),
        activeIcon: CustomSvg(asset: "assets/icons/booking_active.svg"),
        label: "Bookings",
      ),
      BottomNavigationBarItem(
        icon: CustomSvg(asset: "assets/icons/role_switch.svg"),
        activeIcon: CustomSvg(asset: "assets/icons/role_switch_active.svg"),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: CustomSvg(asset: "assets/icons/chat.svg"),
        activeIcon: CustomSvg(asset: "assets/icons/message.svg"),
        label: "Chat",
      ),
      BottomNavigationBarItem(
        icon: CustomSvg(asset: "assets/icons/profile.svg"),
        activeIcon: CustomSvg(asset: "assets/icons/profile_active.svg"),
        label: "Profile",
      ),
    ];
    
    var userItems = [
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
    ];
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: AppColors.secondaryBg),
      child: BottomNavigationBar(
        onTap: onChanged,
        currentIndex: index,
        selectedLabelStyle: AppTexts.txss.copyWith(color: AppColors.mint),
        selectedItemColor: AppColors.mint,
        showSelectedLabels: true,
        items: role == Role.user
            ? userItems
            : role == Role.professional
            ? professionalItems
            : [],
      ),
    );
  }
}
