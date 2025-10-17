import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/profile_picture.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<Widget> messages = [];

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    getMessages();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.charcoal,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Center(child: CustomSvg(asset: "assets/icons/back.svg")),
        ),
        title: Row(
          children: [
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              size: 44,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile Name", style: AppTexts.txls),
                Text(
                  "Active Now",
                  style: AppTexts.txsm.copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            height: 1,
            width: double.infinity,
            color: AppColors.gray.shade600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: 20),
                bottom: false,
                child: Column(children: messages),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 4),
            decoration: BoxDecoration(
              color: AppColors.secondaryBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message",
                          hintStyle: AppTexts.tmdr.copyWith(
                            color: AppColors.gray.shade300,
                          ),
                        ),
                        style: AppTexts.tlgr,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomSvg(asset: "assets/icons/send.svg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getMessages() {
    messages.clear();
    messages.addAll([
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
    ]);
  }

  Widget recieveMessage(
    String? messgae, {
    bool hasPrev = false,
    bool hasNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: hasPrev ? 2 : 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hasPrev
                    ? SizedBox(height: 28, width: 40)
                    : ProfilePicture(
                        image: "https://thispersondoesnotexist.com",
                        size: 40,
                        borderWidth: 0,
                      ),
                const SizedBox(width: 16),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(hasNext ? 4 : 12),
                      ),
                    ),
                    child: Text(messgae ?? "", style: AppTexts.tsmm),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget sendMessage(
    String? messgae, {
    bool hasPrev = false,
    bool hasNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: hasPrev ? 2 : 14),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xff0584FE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(hasNext ? 4 : 12),
                      ),
                    ),
                    child: Text(messgae ?? "", style: AppTexts.tsmm),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
