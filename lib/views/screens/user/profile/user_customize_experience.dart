import 'package:flutter/material.dart';
import 'package:neoterra/models/vibe.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';

class UserCustomizeExperience extends StatefulWidget {
  const UserCustomizeExperience({super.key});

  @override
  State<UserCustomizeExperience> createState() =>
      _UserCustomizeExperienceState();
}

class _UserCustomizeExperienceState extends State<UserCustomizeExperience> {
  List<Vibe> activeVibes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Update Your Experience"),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Text(
                          "Update your vibes",
                          textAlign: TextAlign.center,
                          style: AppTexts.dmdb,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Tell us what you’re intro rightnow. Select at least 3 to get better recommendations across Neoterra.",
                          textAlign: TextAlign.center,
                          style: AppTexts.tmdr.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  for (var i in AppConstants.vibes)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(99),
                            child: Image.asset(
                              i.iconImage,
                              height: 36,
                              width: 36,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            i.name,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Spacer(),
                          Switch(
                            value: activeVibes.contains(i),
                            onChanged: (val) {
                              setState(() {
                                if (val) {
                                  activeVibes.add(i);
                                } else {
                                  activeVibes.remove(i);
                                }
                              });
                            },
                            activeThumbColor: AppColors.mint,
                            inactiveThumbColor: AppColors.secondaryText,
                            inactiveTrackColor: AppColors.secondaryBg,
                          ),
                        ],
                      ),
                    ),
                  
                  const SizedBox(height: 46,),
                  CustomButton(text: "Confirm"),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
