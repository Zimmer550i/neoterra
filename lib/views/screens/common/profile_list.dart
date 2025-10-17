import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/common/inbox.dart';
import 'package:neoterra/views/screens/user/profile/user_profile.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final Future<void> Function() callBack;
  const ProfileList({super.key, required this.title, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: RefreshIndicator(
        onRefresh: callBack,
        color: AppColors.mint,
        backgroundColor: AppColors.card,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            children: [
              const SizedBox(),
              for (int i = 0; i < 20; i++)
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.to(() => UserProfile());
                  },
                  child: Row(
                    children: [
                      ProfilePicture(
                        size: 50,
                        disableGesture: true,
                        borderColor: AppColors.mint,
                        image: "https://thispersondoesnotexist.com",
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Profile Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(() => Inbox());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomSvg(asset: "assets/icons/message.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
