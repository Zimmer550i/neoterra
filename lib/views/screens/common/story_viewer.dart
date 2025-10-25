import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_networked_image.dart';
import 'package:neoterra/views/base/profile_picture.dart';

class StoryViewer extends StatefulWidget {
  const StoryViewer({super.key});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  int index = 0;
  List<String> urls = [
    "https://picsum.photos/1200/1200?seed=100",
    "https://picsum.photos/1200/1200?seed=200",
    "https://picsum.photos/1200/1200?seed=300",
    "https://picsum.photos/1200/1200?seed=400",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    spacing: urls.length < 6
                        ? 16
                        : urls.length < 10
                        ? 8
                        : 4,
                    children: [
                      for (int i = 0; i < urls.length; i++)
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: i <= index
                                  ? AppColors.mint
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ProfilePicture(
                        image: "https://thispersondoesnotexist.com",
                        size: 44,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sean John", style: AppTexts.tsms),
                          Text("Chill", style: AppTexts.txsr),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomNetworkedImage(url: urls[index], radius: 0),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (index > 0) {
                                setState(() {
                                  index--;
                                });
                              }
                              debugPrint("ShowPrevious");
                            },
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (index < urls.length - 1) {
                                setState(() {
                                  index++;
                                });
                              }
                              debugPrint("ShowNext");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
