import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_confirmation.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/party_card.dart';
import 'package:neoterra/views/screens/common/profile_list.dart';
import 'package:neoterra/views/screens/organizer/dashboard/organizer_create_party.dart';
import 'package:neoterra/views/screens/organizer/dashboard/organizer_ticketing.dart';
import 'package:neoterra/views/screens/organizer/management/organizer_duplicate.dart';
import 'package:neoterra/views/screens/organizer/management/organizer_export_guestlist.dart';
import 'package:neoterra/views/screens/organizer/management/organizer_send_comp.dart';
import 'package:share_plus/share_plus.dart';

class OrganizerManagement extends StatefulWidget {
  const OrganizerManagement({super.key});

  @override
  State<OrganizerManagement> createState() => _OrganizerManagementState();
}

class _OrganizerManagementState extends State<OrganizerManagement> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Event Management"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                spacing: 12,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: tab == 0
                            ? AppColors.mint
                            : AppColors.secondaryBg,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        "Overview",
                        style: TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: tab == 1
                            ? AppColors.mint
                            : AppColors.secondaryBg,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        "Action",
                        style: TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: tab == 2
                            ? AppColors.mint
                            : AppColors.secondaryBg,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        "Analytics",
                        style: TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (tab == 0) overview(),
              if (tab == 1) action(),
              if (tab == 2) analytics(),
            ],
          ),
        ),
      ),
    );
  }

  Container action() {
    InkWell actionButton(
      String assetName,
      String title,
      void Function() onTap,
    ) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              CustomSvg(
                asset: "assets/icons/$assetName.svg",
                size: 24,
                color: Colors.white,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        spacing: 16,
        children: [
          actionButton("edit", "Edit Event", () {
            Get.to(() => OrganizerCreateParty());
          }),
          actionButton("tickets", "View Ticket Tiers", () {
            Get.to(() => OrganizerTicketing(forward: false));
          }),
          actionButton("eye", "View Attendies", () {
            Get.to(
              () => ProfileList(title: "Attendies", callBack: () async {}),
            );
          }),
          actionButton("send_2", "Send Comps", () {
            Get.to(() => OrganizerSendComp());
          }),
          actionButton("share_2", "Share Event", () {
            SharePlus.instance.share(ShareParams(text: "Hola Amigos??"));
          }),
          actionButton("copy", "Duplicate", () {
            Get.to(() => OrganizerDuplicate());
          }),
          actionButton("eye_off", "Hide Event", () {
            showConfirmation(
              title: "Hide Event",
              description: "Are you sure you want to hide this event?",
              confirmText: "Hide",
              cancelText: "Cancel",
              onConfirm: () {},
              context: context,
            );
          }),
          actionButton("download", "Export Guestlist", () {
            Get.to(() => OrganizerExportGuestlist());
          }),
          actionButton("delete", "Delete Event", () {
            showConfirmation(
              title: "Delete",
              description: "Are you sure you want to Delete?",
              confirmText: "Delete",
              cancelText: "Cancel",
              onConfirm: () {},
              context: context,
            );
          }),
        ],
      ),
    );
  }

  Column overview() {
    return Column(
      spacing: 16,
      children: [
        PartyCard(seed: 99),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.circular(16),
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.circular(16),
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
      ],
    );
  }

  Widget analytics() {
    return Column(
      spacing: 12,
      children: [
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Last 7 days",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      "Sales",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 32,
                        height: 1,
                      ),
                    ),
                    Text(
                      "180",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.mint,
                        fontSize: 32,
                        height: 1,
                      ),
                    ),
                    Text(
                      "Ticket Sold",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.15,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: 60,
                                color: AppColors.mint,
                                title: "",
                                radius: 16,
                              ),
                              PieChartSectionData(
                                value: 20,
                                color: Color(0xff076974),
                                title: "",
                                radius: 16,
                              ),
                              PieChartSectionData(
                                value: 20,
                                color: Color(0xff004354),
                                title: "",
                                radius: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mint,
                          ),
                        ),
                        Text(
                          "App 60%",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff076974),
                          ),
                        ),
                        Text(
                          "Others 40%",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ticket Sales by Tier", style: AppTexts.dxsb),
              Text(
                "General Admission \$2.40",
                style: AppTexts.tmdr.copyWith(color: AppColors.secondaryText),
              ),
              LinearProgressIndicator(
                value: 0.6,
                color: AppColors.mint,
                minHeight: 16,
                borderRadius: BorderRadius.circular(99),
              ),

              Row(
                children: [
                  Text("158 tickets", style: AppTexts.tlgr),
                  Spacer(),
                  Text(
                    "31",
                    style: AppTexts.tlgr.copyWith(color: AppColors.coral),
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            spacing: 16,
            children: [
              Text("13%", style: AppTexts.dlgs),
              Text(
                "Conversion Rate",
                style: AppTexts.txls.copyWith(color: AppColors.secondaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
