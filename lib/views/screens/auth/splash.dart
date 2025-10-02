import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
// import 'package:neoterra/views/screens/auth/organizer_splash.dart';
// import 'package:neoterra/views/screens/auth/professional_splash.dart';
import 'package:neoterra/views/screens/auth/user_splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  void handleVerification() async {
    await Future.delayed(Duration(seconds: 1));
    Get.offAll(() => UserSplash(), transition: Transition.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage("assets/images/user_splash.jpg"), context);
      precacheImage(AssetImage("assets/images/organizer_splash.jpg"), context);
      precacheImage(
        AssetImage("assets/images/professional_splash.jpg"),
        context,
      );
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
