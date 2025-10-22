import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/views/base/custom_calendar.dart';

showCustomCalendar(
  BuildContext context,
  List<DateTime> selectedDates,
  Function(DateTime) onSingleDateSelected,
) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.6),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.secondaryBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white30),
              ),
              child: CustomCalendar(
                selectedDates: selectedDates,
                onDateSelected: (date) {
                  setState(() {
                    onSingleDateSelected(date);
                  });
                },
              ),
            ),
          );
        },
      );
    },
  );
}
