import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_search_bar.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/common/chat.dart';

class Inbox extends StatelessWidget {
  final bool showAppBar;
  const Inbox({super.key, this.showAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? CustomAppBar(title: "Inbox") : null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomSearchBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      spacing: 20,
                      children: [
                        const SizedBox(height: 4),
                        for (int i = 0; i < 10; i++)
                          InkWell(
                            onTap: () {
                              Get.to(() => Chat());
                            },
                            child: Row(
                              children: [
                                ProfilePicture(
                                  image: "https://thispersondoesnotexist.com",
                                  size: 52,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("User Name", style: AppTexts.tmds),
                                      Text(
                                        "Hi, how are you doing? Is everything going alright?",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTexts.txsr.copyWith(
                                          color: AppColors.secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "2m",
                                      style: AppTexts.txsm.copyWith(
                                        color: AppColors.secondaryText,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        color: AppColors.gray.shade700,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "3",
                                          style: AppTexts.txsr.copyWith(
                                            color: AppColors.cyan,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
