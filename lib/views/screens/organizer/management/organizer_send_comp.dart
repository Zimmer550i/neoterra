import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';

class OrganizerSendComp extends StatefulWidget {
  const OrganizerSendComp({super.key});

  @override
  State<OrganizerSendComp> createState() => _OrganizerSendCompState();
}

class _OrganizerSendCompState extends State<OrganizerSendComp> {
  List<TextEditingController> controllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text("Send Comp Ticket", style: AppTexts.dsmm),
              const SizedBox(height: 4),
              Text(
                "Send a complimentary ticket to a guest at this event",
                textAlign: TextAlign.center,
                style: AppTexts.tmdm.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 24),
              for (int i = 0; i < controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          title: i == 0 ? "Guest name or number" : null,
                          hintText: "Guest name or number",
                        ),
                      ),
                      if (i != 0)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              controllers.removeAt(i);
                            });
                          },
                          icon: Icon(Icons.close_rounded, color: Colors.white),
                        ),
                    ],
                  ),
                ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    controllers.add(TextEditingController());
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.card,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      CustomSvg(asset: "assets/icons/plus.svg"),
                      Text("Add More", style: AppTexts.tlgr),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80),
              CustomButton(
                onTap: () {
                  Get.back();
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
