import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/models/vibe.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/auth/login.dart';

class YourWorld extends StatefulWidget {
  final List<Vibe> vibes;
  const YourWorld({super.key, required this.vibes});

  @override
  State<YourWorld> createState() => _YourWorldState();
}

class _YourWorldState extends State<YourWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "Your world is now unlocked.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "We’ve curated your feed based on your vibe. you can always update your preferences in your profile.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.vibes.length,
                      itemBuilder: (context, index) {
                        final item = widget.vibes.elementAt(index);

                        return ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(99),
                                child: Image.asset(
                                  item.iconImage,
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Spacer(),
                              Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
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
                      Get.to(() => Login());
                    },
                    text: "Explore Neoterra",
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
