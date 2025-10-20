import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_confirmation.dart';
import 'package:neoterra/views/base/custom_bottom_navbar.dart';
import 'package:neoterra/views/base/home_bar.dart';
import 'package:neoterra/views/screens/user/explore/user_explore.dart';
import 'package:neoterra/views/screens/user/home/user_home.dart';
import 'package:neoterra/views/screens/user/profile/profile_settings.dart';
import 'package:neoterra/views/screens/user/profile/user_info.dart';
import 'package:neoterra/views/screens/user/profile/user_customize_experience.dart';
import 'package:neoterra/views/screens/user/profile/user_profile.dart';
import 'package:neoterra/views/screens/user/profile/user_profile_information.dart';
import 'package:neoterra/views/screens/user/role/user_change_role.dart';
import 'package:neoterra/views/screens/user/tickets/user_tickets.dart';

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  int index = 0;

  List<Widget> pages = [
    UserHome(),
    UserExplore(),
    UserChangeRole(),
    UserTickets(),
    UserProfile(isUser: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(hasMoreOptions: index == 4),
      body: pages[min(pages.length - 1, index)],
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
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
                  "Customize My Experience",
                  () {
                    Get.to(() => UserCustomizeExperience());
                  },
                ),
                drawerButton(
                  "assets/icons/user.svg",
                  "Profile Information",
                  () {
                    Get.to(() => UserProfileUserInformation());
                  },
                ),
                drawerButton("assets/icons/user.svg", "Profile Settings", () {
                  Get.to(() => ProfileSettings());
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
