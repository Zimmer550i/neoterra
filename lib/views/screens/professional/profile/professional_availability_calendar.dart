import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_calendar.dart';

class ProfessionalAvailabilityCalendar extends StatefulWidget {
  const ProfessionalAvailabilityCalendar({super.key});

  @override
  State<ProfessionalAvailabilityCalendar> createState() =>
      _ProfessionalAvailabilityCalendarState();
}

class _ProfessionalAvailabilityCalendarState
    extends State<ProfessionalAvailabilityCalendar> {
  List<DateTime> selectedDate = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Availability Calendar"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              CustomCalendar(
                isEditable: true,
                selectedDates: selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    if (selectedDate.contains(date)) {
                      selectedDate.remove(date);
                    } else {
                      selectedDate.add(date);
                    }
                  });
                },
              ),
              Spacer(),
              CustomButton(
                onTap: () {
                  Get.back();
                },
                text: "Change Availability",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
