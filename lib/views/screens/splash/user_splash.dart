import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/splash/find_your_vibes.dart';

class UserSplash extends StatelessWidget {
  const UserSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/user_splash.jpg",
              fit: BoxFit.cover,
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
                  Text(
                    "Connecting you to the Best Cultural Experiences",
                    style: AppTexts.dxss,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    onTap: () {
                      Get.to(() => FindYourVibes());
                    },
                    text: "Get Started",
                    trailing: "assets/icons/arrow_right.svg",
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
