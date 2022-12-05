import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPageBody extends StatefulWidget {
  const CalendarPageBody({super.key});

  @override
  State<CalendarPageBody> createState() => _CalendarPageBodyState();
}

class _CalendarPageBodyState extends State<CalendarPageBody> {
  DateTime selectedDayTmp = DateTime.now();
  DateTime focusedDayTmp = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TableCalendar(
        focusedDay: focusedDayTmp,
        currentDay: selectedDayTmp,
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2024, 1, 1),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDayTmp, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDayTmp, selectedDay)) {
            setState(() {
              selectedDayTmp = selectedDay;
              focusedDayTmp = focusedDay;
            });
          }

          debugPrint(focusedDay.toIso8601String());
          debugPrint(selectedDay.toIso8601String());

          debugPrint(focusedDayTmp.toIso8601String());
          debugPrint(selectedDayTmp.toIso8601String());
        },
        onPageChanged: (focusedDay) {
          focusedDayTmp = focusedDay;
        },
      ),
    );
  }
}
