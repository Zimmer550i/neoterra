import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/party_card.dart';
import 'package:neoterra/views/base/party_card_compact.dart';
import 'package:neoterra/views/base/profile_picture.dart';

class UserProfile extends StatefulWidget {
  final bool isUser;
  const UserProfile({super.key, this.isUser = false});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isUser ? null : CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProfilePicture(
                image: "https://thispersondoesnotexist.com",
                size: 140,
              ),
              const SizedBox(height: 12),
              Text(
                "User Name",
                style: AppTexts.dxsm,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "music head. love the vibe. always outside",
                style: AppTexts.tsmr,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Follow",
                    height: 40,
                    isSecondary: true,
                    width: null,
                  ),
                  // CustomButton(
                  //   text: "Following",
                  //   height: 40,
                  //   isSecondary: false,
                  //   width: null,
                  // ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomSvg(asset: "assets/icons/tiktok_button.svg"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomSvg(asset: "assets/icons/insta_button.svg"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tab = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: tab == 0
                                  ? AppColors.mint
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Events",
                            style: AppTexts.txls.copyWith(
                              color: tab == 0
                                  ? Colors.white
                                  : AppColors.gray.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tab = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: tab == 1
                                  ? AppColors.mint
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Saved Parties",
                            style: AppTexts.txls.copyWith(
                              color: tab == 1
                                  ? Colors.white
                                  : AppColors.gray.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (tab == 1) {
                    return PartyCardCompact(seed: index + 1);
                  }
                  return PartyCard(seed: index + 1);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
