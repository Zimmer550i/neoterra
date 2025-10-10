import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_bottom_navbar.dart';
import 'package:neoterra/views/base/home_bar.dart';

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  int index = 0;

  List<Widget> pages = [
    FlutterLogo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(hasMoreOptions: index == 4),
      body: pages[min(pages.length-1, index)],
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
                  () {},
                ),
                drawerButton(
                  "assets/icons/user.svg",
                  "Profile Information",
                  () {},
                ),
                drawerButton(
                  "assets/icons/user.svg",
                  "Profile Settings",
                  () {},
                ),
                drawerButton(
                  "assets/icons/terms.svg",
                  "Terms of Services",
                  () {},
                ),
                drawerButton(
                  "assets/icons/privacy_policy.svg",
                  "Privacy Policy",
                  () {},
                ),
                drawerButton("assets/icons/about_us.svg", "About Us", () {}),
                drawerButton("assets/icons/logout.svg", "Logout", () {}),
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
