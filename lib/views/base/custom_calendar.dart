import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomCalendar extends StatefulWidget {
  final Function(List<DateTime>) onMultipleSelected;
  final Function(DateTime) onSigleDateSelected;
  const CustomCalendar({
    super.key,
    required this.onMultipleSelected,
    required this.onSigleDateSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondaryBg,
        boxShadow: [
          BoxShadow(
            offset: Offset(8, 3),
            blurRadius: 22,
            spreadRadius: 10,
            color: Colors.black.withValues(alpha: 0.13),
          ),
        ],
      ),
      child: SfCalendar(
        view: CalendarView.month,
        todayHighlightColor: AppColors.mint,
        selectionDecoration: BoxDecoration(),
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.targetElement ==
              CalendarElement.calendarCell) {
            final DateTime date = calendarTapDetails.date!;
            setState(() {
              if (selectedDates.contains(date)) {
                selectedDates.remove(date);
              } else {
                selectedDates.add(date);
              }
            });
            widget.onMultipleSelected(selectedDates);
            // widget.onSingleDateSelected(date);
          }
        },
        monthCellBuilder: (context, details) {
          final bool isSelected = selectedDates.any(
            (d) =>
                d.year == details.date.year &&
                d.month == details.date.month &&
                d.day == details.date.day,
          );

          return Center(
            child: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: details.date.day == DateTime.now().day
                    ? AppColors.mint
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: AppColors.mint) : null,
              ),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  '${details.date.day}',
                  style: AppTexts.tsmm.copyWith(
                    color: details.date.month != DateTime.now().month
                        ? Colors.grey.shade700
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
