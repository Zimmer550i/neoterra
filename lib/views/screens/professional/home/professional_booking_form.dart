import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/utils/custom_svg.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_text_field.dart';

class ProfessionalBookingForm extends StatefulWidget {
  final String title;
  final bool isEditable;
  final Widget actions;
  const ProfessionalBookingForm({
    super.key,
    required this.title,
    this.isEditable = false,
    required this.actions,
  });

  @override
  State<ProfessionalBookingForm> createState() =>
      _ProfessionalBookingFormState();
}

class _ProfessionalBookingFormState extends State<ProfessionalBookingForm> {
  DateTime? date;
  TimeOfDay? start;
  TimeOfDay? end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Professional: Daisy Khala", style: AppTexts.tlgs),
                    Row(
                      spacing: 8,
                      children: [
                        Text("Event: ", style: AppTexts.tlgs),
                        if (!widget.isEditable)
                          Text(
                            "Event name here",
                            style: AppTexts.tsmr.copyWith(
                              color: AppColors.gray.shade300,
                            ),
                          ),
                        if (widget.isEditable)
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                isCollapsed: true,
                                hintText: "Enter event name",
                                hintStyle: AppTexts.tsmr.copyWith(
                                  color: AppColors.gray.shade300,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Date: ", style: AppTexts.tlgs),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final temp = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (temp != null) {
                                setState(() {
                                  date = temp;
                                });
                              }
                            },
                            child: Row(
                              spacing: 4,
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/calendar.svg",
                                  size: 20,
                                ),
                                Text(
                                  date == null
                                      ? "Select date"
                                      : DateFormat(
                                          'MMM dd, yyyy',
                                        ).format(date!),
                                  style: AppTexts.tsmr.copyWith(
                                    color: date == null
                                        ? AppColors.gray.shade300
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16),
                        // Expanded(
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Row(
                        //       spacing: 4,
                        //       children: [
                        //         CustomSvg(
                        //           asset: "assets/icons/clock.svg",
                        //           size: 20,
                        //         ),
                        //         Text(
                        //           "Select date",
                        //           style: AppTexts.tsmr.copyWith(
                        //             color: AppColors.gray.shade300,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Time: ", style: AppTexts.tlgs),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final temp = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (temp != null) {
                                setState(() {
                                  start = temp;
                                });
                              }
                            },
                            child: Row(
                              spacing: 4,
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/clock.svg",
                                  size: 20,
                                ),
                                Text(
                                  start == null
                                      ? "Start time"
                                      : formatTimeOfDay(start!),
                                  style: AppTexts.tsmr.copyWith(
                                    color: end == null
                                        ? AppColors.gray.shade300
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final temp = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (temp != null) {
                                setState(() {
                                  end = temp;
                                });
                              }
                            },
                            child: Row(
                              spacing: 4,
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/clock.svg",
                                  size: 20,
                                ),
                                Text(
                                  end == null
                                      ? "End time"
                                      : formatTimeOfDay(end!),
                                  style: AppTexts.tsmr.copyWith(
                                    color: end == null
                                        ? AppColors.gray.shade300
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Text("Location: ", style: AppTexts.tlgs),
                        if (!widget.isEditable)
                          Text(
                            "Event location here",
                            style: AppTexts.tsmr.copyWith(
                              color: AppColors.gray.shade300,
                            ),
                          ),
                        if (widget.isEditable)
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                isCollapsed: true,
                                hintText: "Enter location",
                                hintStyle: AppTexts.tsmr.copyWith(
                                  color: AppColors.gray.shade300,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Text("Price: \$800", style: AppTexts.tlgs),
                    if (!widget.isEditable)
                    Text(
                      "Special instructions about the Event here",
                      style: AppTexts.tlgr.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    if (widget.isEditable)
                      CustomTextField(
                        lines: 6,
                        hintText:
                            "Add any special requests or instructions (optional)",
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              widget.actions,
            ],
          ),
        ),
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('hh:mm a').format(dt); // Example: 09:45 PM
  }
}
