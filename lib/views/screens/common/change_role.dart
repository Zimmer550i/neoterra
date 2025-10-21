import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/models/user.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/splash/organizer_splash.dart';
import 'package:neoterra/views/screens/splash/professional_splash.dart';
import 'package:neoterra/views/screens/splash/user_splash.dart';

class ChangeRole extends StatefulWidget {
  final Role role;
  const ChangeRole({super.key, required this.role});

  @override
  State<ChangeRole> createState() => _ChangeRoleState();
}

class _ChangeRoleState extends State<ChangeRole> {
  int? index;

  void onConfirm() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Want to Switch Your Role?",
            textAlign: TextAlign.center,
            style: AppTexts.dxss,
          ),
          const SizedBox(height: 4),
          Text(
            "Your role will determine the features and experience you get with Neoterra",
            textAlign: TextAlign.center,
            style: AppTexts.tmdm.copyWith(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 40),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.role != Role.user)
                card(
                  "assets/images/user_splash.jpg",
                  "Attendie",
                  "View events or purchase tickets",
                  0,
                ),
              if (widget.role != Role.organizer)
                card(
                  "assets/images/organizer_splash.jpg",
                  "Event Organizer",
                  "Host your own events, sell tickets, and build your scene.",
                  widget.role == Role.professional ? 1 : 0,
                ),
              if (widget.role != Role.professional)
                card(
                  "assets/images/professional_splash.jpg",
                  "Event Professional",
                  "Get booked for gigs DJs, hosts, security, bartenders, and more.",
                  1,
                ),
            ],
          ),
          Spacer(),
          Visibility(
            visible: index != null,
            replacement: const SizedBox(height: 50),
            child: CustomButton(
              onTap: () {
                switch (widget.role) {
                  case Role.user:
                    if (index == 0) {
                      Get.offAll(() => OrganizerSplash());
                    } else {
                      Get.offAll(() => ProfessionalSplash());
                    }
                    break;

                  case Role.organizer:
                    if (index == 0) {
                      Get.offAll(() => UserSplash());
                    } else {
                      Get.offAll(() => ProfessionalSplash());
                    }
                    break;

                  case Role.professional:
                    if (index == 0) {
                      Get.offAll(() => UserSplash());
                    } else {
                      Get.offAll(() => OrganizerSplash());
                    }
                    break;
                }
              },
              text: "Confirm",
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget card(String asset, String tile, String subtitle, int pos) {
    bool isSelected = index == pos;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (index != pos) {
              index = pos;
            } else {
              index = null;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              color: isSelected ? AppColors.mint : Colors.transparent,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(asset, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 8),
              Text(tile, textAlign: TextAlign.center, style: AppTexts.tmds),
              Text(subtitle, textAlign: TextAlign.center, style: AppTexts.txsr),
            ],
          ),
        ),
      ),
    );
  }
}
