import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neoterra/models/vibe.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_drop_down.dart';
import 'package:neoterra/views/base/custom_text_field.dart';
import 'package:neoterra/views/base/image_picker_widget.dart';

class OrganizerCreateParty extends StatefulWidget {
  const OrganizerCreateParty({super.key});

  @override
  State<OrganizerCreateParty> createState() => _OrganizerCreatePartyState();
}

class _OrganizerCreatePartyState extends State<OrganizerCreateParty> {
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final quantityCtrl = TextEditingController();
  final refundCtrl = TextEditingController();
  final maxTicketCtrl = TextEditingController();

  List<Vibe> vibes = [];

  bool stack = false;
  bool maxTicket = false;

  DateTime? start;
  DateTime? end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create New Event"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 24,
            children: [
              const SizedBox(height: 0),
              ImagePickerWidget(),
              CustomTextField(
                controller: nameCtrl,
                title: "Event Name",
                hintText: "Enter event name",
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: priceCtrl,
                      textInputType: TextInputType.number,
                      title: "Price",
                      hintText: "Enter price",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      controller: quantityCtrl,
                      textInputType: TextInputType.number,
                      title: "Quantity",
                      hintText: "Enter quantity",
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextField(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        if (picked != null) {
                          setState(() {
                            start = picked;
                          });
                        }
                      },
                      // isDisabled: true,
                      title: "Sales Period",
                      controller: TextEditingController(
                        text: start != null
                            ? DateFormat("dd MMM, yy").format(start!)
                            : "",
                      ),
                      hintText: "Starts",
                      leading: "assets/icons/calendar.svg",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        if (picked != null) {
                          setState(() {
                            end = picked;
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: end != null
                            ? DateFormat("dd MMM, yy").format(end!)
                            : "",
                      ),
                      hintText: "Ends",
                      leading: "assets/icons/calendar.svg",
                    ),
                  ),
                ],
              ),
              CustomTextField(
                controller: refundCtrl,
                title: "Refund Policy",
                hintText: "Enter policy (e.g..No refunds)",
              ),
              CustomDropDown(
                title: "Visibility",
                options: ["Visible on Sale", "Instant", "3 Days prior"],
                onChanged: (val) {},
                initialPick: 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vibes & Tags", style: AppTexts.tlgs),
                  const SizedBox(width: double.infinity, height: 8,),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: AppConstants.vibes
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (vibes.contains(e)) {
                                  vibes.remove(e);
                                } else {
                                  vibes.add(e);
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: vibes.contains(e) ? e.color : null,
                                borderRadius: BorderRadius.circular(99),
                                border: vibes.contains(e) ? null : Border.all(color: Colors.white)
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 8,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      99,
                                    ),
                                    child: SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Image.asset(e.coverImage),
                                    ),
                                  ),
                                  Text(e.name, style: AppTexts.txsm),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              options(
                "Stack Tiers",
                "Sell this ticket tier alongside other tiers",
                stack,
                onChanged: (val) {
                  setState(() {
                    stack = val;
                  });
                },
              ),
              options(
                "Max Ticket Per Purchase",
                "Limit ticket quantity per order",
                maxTicket,
                onChanged: (val) {
                  setState(() {
                    maxTicket = val;
                  });
                },
              ),
              if (maxTicket)
                CustomTextField(
                  controller: maxTicketCtrl,
                  hintText: "Enter Max Limit",
                ),
              const SizedBox(),
              CustomButton(text: "Create Event"),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(
    String title,
    String? subtitle,
    bool value, {
    void Function(bool)? onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.gray.shade300,
                  ),
                ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.mint,
          inactiveThumbColor: AppColors.secondaryText,
          inactiveTrackColor: AppColors.secondaryBg,
        ),
      ],
    );
  }
}
