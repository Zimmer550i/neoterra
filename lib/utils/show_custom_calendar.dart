import 'package:flutter/material.dart';
import 'package:neoterra/views/base/custom_calendar.dart';

showCustomCalendar(
  BuildContext context,
  Function(List<DateTime>) onMultipleSelected,
  Function(DateTime) onSigleDateSelected,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(40),
        child: CustomCalendar(
          onDateSelected: onSigleDateSelected,
        ),
      );
    },
  );
}
