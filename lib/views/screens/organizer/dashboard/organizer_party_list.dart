import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/utils/show_custom_calendar.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/party_card_compact.dart';

class OrganizerPartyList extends StatefulWidget {
  const OrganizerPartyList({super.key});

  @override
  State<OrganizerPartyList> createState() => _OrganizerPartyListState();
}

class _OrganizerPartyListState extends State<OrganizerPartyList> {
  List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Events"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 12,
            children: [
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () =>
                      showCustomCalendar(context, selectedDates, (date) {
                        setState(() {
                          if (selectedDates.contains(date)) {
                            selectedDates.remove(date);
                          } else {
                            selectedDates.add(date);
                          }
                        });
                      }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: BoxDecoration(
                      color: selectedDates.isEmpty
                          ? AppColors.mint
                          : AppColors.coral,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        CustomSvg(
                          asset: "assets/icons/calendar.svg",
                          color: Colors.white,
                          size: 16,
                        ),
                        Text("Calendar", style: AppTexts.txsm),
                      ],
                    ),
                  ),
                ),
              ),
              for (int i = 0; i < 10; i++) PartyCardCompact(seed: i + 20),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
