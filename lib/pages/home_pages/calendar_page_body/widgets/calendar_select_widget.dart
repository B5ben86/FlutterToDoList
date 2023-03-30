import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSelectWidget extends StatefulWidget {
  final Function(DateTime) onDaySelected;
  const CalendarSelectWidget(this.onDaySelected, {super.key});

  @override
  State<CalendarSelectWidget> createState() => _CalendarSelectWidgetState();
}

class _CalendarSelectWidgetState extends State<CalendarSelectWidget> {
  DateTime selectedDayTmp = DateTime.now();
  DateTime focusedDayTmp = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableCalendarFormats: const {CalendarFormat.week: 'week'},
      calendarFormat: CalendarFormat.week,
      headerVisible: true,
      headerStyle: const HeaderStyle(
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            size: 26,
            color: Colors.white,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 26,
          )),
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
          widget.onDaySelected(selectedDayTmp);
        }

        debugPrint(focusedDay.toIso8601String());
        debugPrint(selectedDay.toIso8601String());

        debugPrint(focusedDayTmp.toIso8601String());
        debugPrint(selectedDayTmp.toIso8601String());
      },
      onPageChanged: (focusedDay) {
        focusedDayTmp = focusedDay;
      },
    );
  }
}
