import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/screens/organizer/dashboard/organizer_create_party.dart';

class OrganizerTicketing extends StatefulWidget {
  final bool forward;
  const OrganizerTicketing({super.key, this.forward = true});

  @override
  State<OrganizerTicketing> createState() => _OrganizerTicketingState();
}

class _OrganizerTicketingState extends State<OrganizerTicketing> {
  bool neo = false;
  bool ext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Ticketing"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                "Choose how your tickets will be handled: Neoterra or External",
                style: AppTexts.tmdr,
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  if (!widget.forward) return;
                  setState(() {
                    if (neo) {
                      neo = false;
                    } else {
                      neo = true;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: neo ? AppColors.mint : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.mint,
                        ),
                        child: Center(
                          child: CustomSvg(
                            asset: "assets/icons/tickets.svg",
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text("Neoterra Ticketing", style: AppTexts.txls),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  if (!widget.forward) return;
                  setState(() {
                    if (ext) {
                      ext = false;
                    } else {
                      ext = true;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ext ? AppColors.mint : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.mint,
                        ),
                        child: Center(
                          child: CustomSvg(
                            asset: "assets/icons/link.svg",
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text("External Ticketing", style: AppTexts.txls),
                    ],
                  ),
                ),
              ),
              Spacer(),

              if (widget.forward)
                CustomButton(
                  onTap: () {
                    Get.to(() => OrganizerCreateParty());
                  },
                  text: "Confirm",
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
