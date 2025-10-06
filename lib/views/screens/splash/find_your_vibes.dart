import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/models/vibe.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/splash/your_world.dart';

class FindYourVibes extends StatefulWidget {
  const FindYourVibes({super.key});

  @override
  State<FindYourVibes> createState() => _FindYourVibesState();
}

class _FindYourVibesState extends State<FindYourVibes> {
  List<Vibe> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CustomSvg(asset: "assets/icons/logo.svg"),
                  const SizedBox(height: 8),
                  Text(
                    "Find Your Vibe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Select at least 3",
                    style: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
                  ),
                  const SizedBox(height: 24),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AppConstants.vibes.length,
                    itemBuilder: (context, index) {
                      final item = AppConstants.vibes.elementAt(index);
                      bool isSelected = selected.contains(item);

                      return ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selected.remove(item);
                              } else {
                                selected.add(item);
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  item.coverImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(
                                      alpha: isSelected ? 0.3 : 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected
                                        ? Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.description,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 30,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    onTap: () {
                      Get.to(() => YourWorld(vibes: selected));
                    },
                    text: "Unlock my world",
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
