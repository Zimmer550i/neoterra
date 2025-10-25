import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/models/user.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_confirmation.dart';
import 'package:neoterra/views/base/custom_bottom_navbar.dart';
import 'package:neoterra/views/base/home_bar.dart';
import 'package:neoterra/views/screens/common/change_role.dart';
import 'package:neoterra/views/screens/common/inbox.dart';
import 'package:neoterra/views/screens/organizer/analytics/organizer_analytics.dart';
import 'package:neoterra/views/screens/organizer/profile/organizer_profile.dart';
import 'package:neoterra/views/screens/organizer/profile/organizer_profile_information.dart';
import 'package:neoterra/views/screens/professional/home/professional_home.dart';
import 'package:neoterra/views/screens/professional/profile/professional_earnings.dart';
import 'package:neoterra/views/screens/user/profile/user_info.dart';

class OrganizerApp extends StatefulWidget {
  const OrganizerApp({super.key});

  @override
  State<OrganizerApp> createState() => _OrganizerAppState();
}

class _OrganizerAppState extends State<OrganizerApp> {
  int index = 0;

  List<Widget> pages = [
    ProfessionalHome(),
    OrganizerAnalytics(),
    ChangeRole(role: Role.organizer),
    Inbox(),
    OrganizerProfile(isUser: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(hasMoreOptions: index == 4),
      body: pages[min(pages.length - 1, index)],
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
        role: Role.organizer,
        onChanged: (val) {
          setState(() {
            index = val;
          });
        },
      ),
      drawer: Container(
        decoration: BoxDecoration(color: AppColors.gray.shade900),
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 12),
                  child: CustomSvg(asset: "assets/icons/logo.svg"),
                ),
                drawerButton(
                  "assets/icons/customize.svg",
                  "Earnings & Payout",
                  () {
                    Get.to(() => ProfessionalEarnings());
                  },
                ),
                drawerButton(
                  "assets/icons/user.svg",
                  "Profile Information",
                  () {
                    Get.to(() => OrganizerProfileInformation());
                  },
                ),
                drawerButton("assets/icons/terms.svg", "Booking Policies", () {
                  Get.to(
                    () => UserInfo(title: "Booking Policies", data: "data"),
                  );
                }),
                drawerButton("assets/icons/terms.svg", "Terms of Services", () {
                  Get.to(
                    () => UserInfo(title: "Terms of Conditions", data: "data"),
                  );
                }),
                drawerButton(
                  "assets/icons/privacy_policy.svg",
                  "Privacy Policy",
                  () {
                    Get.to(
                      () => UserInfo(title: "Privacy Policy", data: "data"),
                    );
                  },
                ),
                drawerButton("assets/icons/about_us.svg", "About Us", () {
                  Get.to(() => UserInfo(title: "About Us", data: "data"));
                }),
                drawerButton("assets/icons/logout.svg", "Logout", () {
                  showConfirmation(
                    context: context,
                    title: "Logout",
                    description: "Are you sure toy want to logout?",
                    confirmText: "Yes, logout",
                    cancelText: "No",
                    onConfirm: () {
                      // Add logout logic here
                    },
                    onCancel: () {
                      // Optional: add cancel logic here
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerButton(String logo, String name, Function() onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryBg,
          border: Border(bottom: BorderSide(color: AppColors.gray.shade400)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomSvg(asset: logo),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
