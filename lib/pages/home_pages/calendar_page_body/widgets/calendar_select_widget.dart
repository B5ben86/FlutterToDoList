import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';

class CalendarSelectWidget extends StatefulWidget {
  final DateTime selectedDay;
  final DateTimeRange dateTimeRange;
  final Function(DateTime) onDaySelected;
  const CalendarSelectWidget(
      this.selectedDay, this.dateTimeRange, this.onDaySelected,
      {super.key});

  @override
  State<CalendarSelectWidget> createState() => _CalendarSelectWidgetState();
}

class _CalendarSelectWidgetState extends State<CalendarSelectWidget> {
  Map<String, List<String>> makerEvent = {};

  @override
  Widget build(BuildContext context) {
    DateTime selectedDayTmp = widget.selectedDay;
    DateTime focusedDayTmp = selectedDayTmp;

    var taskModelList =
        context.watch<TaskModelMapChangeNotifier>().taskModelList;

    makerEvent = {};
    for (var taskModel in taskModelList) {
      var key = taskModel.dateTime.year.toString() +
          taskModel.dateTime.month.toString() +
          taskModel.dateTime.day.toString();

      makerEvent[key] = ['event'];
    }

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
      calendarStyle: const CalendarStyle(
        markersAnchor: 1.5,
        markersMaxCount: 1,
        markerSizeScale: 0.15,
        markerDecoration: BoxDecoration(
          color: Color(0xff8687e7),
          shape: BoxShape.circle,
        ),
      ),
      eventLoader: (day) {
        var key =
            day.year.toString() + day.month.toString() + day.day.toString();
        return makerEvent[key] ?? [];
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          if (events.isEmpty) {
            return null;
          }
          return null;
        },
      ),
      focusedDay: focusedDayTmp,
      currentDay: selectedDayTmp,
      firstDay: widget.dateTimeRange.start,
      lastDay: widget.dateTimeRange.end,
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
