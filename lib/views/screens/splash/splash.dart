import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
// import 'package:neoterra/views/screens/auth/organizer_splash.dart';
// import 'package:neoterra/views/screens/auth/professional_splash.dart';
import 'package:neoterra/views/screens/splash/user_splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  void handleVerification() async {
    await Future.delayed(Duration(seconds: 1));
    Get.offAll(() => UserSplash(), transition: Transition.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final imageList = [
      "assets/images/user_splash.jpg",
      "assets/images/organizer_splash.jpg",
      "assets/images/professional_splash.jpg",
      "assets/images/culturecreativityncommunity.jpg",
      "assets/images/culturecreativityncommunity_logo.png",
      "assets/images/daypartiesnsocialvibes.jpg",
      "assets/images/daypartiesnsocialvibes_logo.png",
      "assets/images/globalsounds.jpg",
      "assets/images/globalsounds_logo.png",
      "assets/images/hiphop.jpg",
      "assets/images/hiphop_logo.png",
      "assets/images/housendance.jpg",
      "assets/images/housendance_logo.png",
      "assets/images/inclusiveevents.jpg",
      "assets/images/inclusiveevents_logo.png",
      "assets/images/rnb.jpg",
      "assets/images/rnb_logo.png",
      "assets/images/wellness.jpg",
      "assets/images/wellness_logo.png",
    ];

    for (final imagePath in imageList) {
      precacheImage(AssetImage(imagePath), context);
    }

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      );
      handleVerification();
    });

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            CustomSvg(asset: "assets/icons/logo.svg"),
            Text("The culture starts here", style: AppTexts.tlgm),
            Expanded(
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      "Powered by Ed Wynn Presents",
                      style: TextStyle(color: Color(0xffC4C4C4), fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
