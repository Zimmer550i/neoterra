import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/professional/profile/professional_add_media.dart';

class ProfessionalPhotosAndVideos extends StatelessWidget {
  const ProfessionalPhotosAndVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Photos & Videos"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < 10; i++)
                    Container(
                      padding: EdgeInsets.all(8),
                      width: (MediaQuery.of(context).size.width - 40) / 2 - 16,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                "assets/images/hiphop.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "Mix Audio",
                            overflow: TextOverflow.fade,
                            style: AppTexts.tlgs,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                onTap: () {
                  Get.to(() => ProfessionalAddMedia());
                },
                text: "Add New",
                leading: "assets/icons/plus.svg",
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
