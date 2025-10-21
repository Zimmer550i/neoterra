import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/profile_picture.dart';

class UserProfileSettings extends StatefulWidget {
  const UserProfileSettings({super.key});

  @override
  State<UserProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<UserProfileSettings> {
  bool publicProfile = true;
  bool guestList = true;
  bool attending = true;
  bool alerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile Settings"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  ProfilePicture(
                    image: "https://thispersondoesnotexist.com",
                    size: 80,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edwynnx",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "+ 1 288784-3984",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.gray.shade300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              options(
                "Public Profile",
                "Make my profile visable to others",
                publicProfile,
                onChanged: (val) {
                  setState(() {
                    publicProfile = !publicProfile;
                  });
                },
              ),
              const SizedBox(height: 16),
              options(
                "Appear on Guest Lists",
                "Show me on public guestlists",
                guestList,
                onChanged: (val) {
                  setState(() {
                    guestList = !guestList;
                  });
                },
              ),
              const SizedBox(height: 16),
              options(
                "Event I’m Attending",
                "Let others see events I’m attending",
                attending,
                onChanged: (val) {
                  setState(() {
                    attending = !attending;
                  });
                },
              ),

              const SizedBox(height: 32),
              Text(
                "Alerts & Preferences",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColors.cyan.shade400,
                ),
              ),
              const SizedBox(height: 16),
              options(
                "Allow Alerts",
                null,
                alerts,
                onChanged: (val) {
                  setState(() {
                    alerts = !alerts;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                "SMS Transactional Alerts",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Marketing Promotions",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),
              Text(
                "App Info",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColors.cyan.shade400,
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Text(
                    "App Version",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "0.7.1",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(
    String title,
    String? subtitle,
    bool value, {
    void Function(bool)? onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.gray.shade300,
                  ),
                ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.mint,
          inactiveThumbColor: AppColors.secondaryText,
          inactiveTrackColor: AppColors.secondaryBg,
        ),
      ],
    );
  }
}
