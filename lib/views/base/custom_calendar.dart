import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';

class CustomCalendar extends StatefulWidget {
  final bool isEditable;
  final bool multiDatePicker;
  final List<DateTime> selectedDates;
  final Function(DateTime)? onDateSelected;
  const CustomCalendar({
    super.key,
    this.isEditable = false,
    this.multiDatePicker = true,
    this.selectedDates = const [],
    this.onDateSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<DateTime> selectedDates = [];
  DateTime current = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDates = widget.selectedDates;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  current = DateTime(
                    current.year,
                    current.month - 1,
                    current.day,
                  );
                });
              },
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.mint,
                  size: 24,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "${getMonth(current.month)} ${current.year}",
                textAlign: TextAlign.center,
                style: AppTexts.tmdr,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  current = DateTime(
                    current.year,
                    current.month + 1,
                    current.day,
                  );
                });
              },
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.mint,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 44,
              child: Text(
                getWeek(7),
                textAlign: TextAlign.center,
                style: AppTexts.txsr,
              ),
            ),
            for (int i = 1; i < 7; i++)
              SizedBox(
                width: 44,
                child: Text(
                  getWeek(i),
                  textAlign: TextAlign.center,
                  style: AppTexts.txsr,
                ),
              ),
          ],
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: getDays(),
        ),
      ],
    );
  }

  List<Widget> getDays() {
    DateTime start = DateTime(current.year, current.month, 1);
    DateTime end = DateTime(start.year, start.month + 1, start.day);

    List<Widget> rtn = [];

    for (int i = 0; i < (start.weekday % 7); i++) {
      rtn.add(const SizedBox(height: 44, width: 44));
    }

    for (; start.isBefore(end); start = start.add(Duration(days: 1))) {
      rtn.add(dayWidget(start, isSelectedChecker(start)));
    }
    return rtn;
  }

  bool isSelectedChecker(DateTime day) {
    return selectedDates.any(
      (d) => d.year == day.year && d.month == day.month && d.day == day.day,
    );
  }

  Widget dayWidget(DateTime day, bool isSelected) {
    final now = DateTime.now();

    return InkWell(
      onTap: () {
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(day);
        }
      },
      borderRadius: BorderRadius.circular(99),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.card : null,
          border:
              (day.day == now.day &&
                  day.month == now.month &&
                  day.year == now.year)
              ? Border.all(color: AppColors.mint, width: 2)
              : null,
        ),
        child: Center(
          child: Text(
            day.day.toString(),
            style: isSelected
                ? AppTexts.tmds.copyWith(color: AppColors.mint)
                : AppTexts.tmdr,
          ),
        ),
      ),
    );
  }

  String getMonth(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    if (month < 1 || month > 12) return "Invalid";
    return months[month - 1].toUpperCase();
  }

  String getWeek(int weekday) {
    const weeks = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    if (weekday < 1 || weekday > 7) return "Invalid";
    return weeks[weekday - 1].toUpperCase();
  }
}
