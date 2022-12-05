import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void showCalendarPopupDialogWidget(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      DateTime selectedDayTmp = DateTime.now();
      DateTime focusedDayTmp = DateTime.now();
      String buttonText = 'initial';
      // return const _CalendarDialogWidget();
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.only(left: 8, right: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  TableCalendar(
                    focusedDay: focusedDayTmp,
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

                      setState(() {
                        buttonText = focusedDay.day.toString();
                      });
                    },
                    onPageChanged: (focusedDay) {
                      focusedDayTmp = focusedDay;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(buttonText),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// class _CalendarDialogWidget extends StatefulWidget {
//   const _CalendarDialogWidget();

//   @override
//   State<_CalendarDialogWidget> createState() => __DialogWidgetState();
// }

// class __DialogWidgetState extends State<_CalendarDialogWidget> {
//   @override
//   Widget build(BuildContext context) {
//     DateTime selectedDayTmp = DateTime.now();
//     DateTime focusedDayTmp = DateTime.now();
//     String buttonText = 'initial';

//     return StatefulBuilder(
//       builder: (context, setState) {
//         return Dialog(
//           elevation: 0,
//           insetPadding: const EdgeInsets.only(left: 8, right: 8),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             height: 400,
//             width: double.infinity,
//             child: Column(
//               children: [
//                 TableCalendar(
//                   focusedDay: focusedDayTmp,
//                   currentDay: selectedDayTmp,
//                   firstDay: DateTime.utc(2021, 1, 1),
//                   lastDay: DateTime.utc(2024, 1, 1),
//                   selectedDayPredicate: (day) {
//                     return isSameDay(selectedDayTmp, day);
//                   },
//                   onDaySelected: (selectedDay, focusedDay) {
//                     if (!isSameDay(selectedDayTmp, selectedDay)) {
//                       setState(() {
//                         selectedDayTmp = selectedDay;
//                         focusedDayTmp = focusedDay;
//                       });
//                     }

//                     debugPrint(focusedDay.toIso8601String());
//                     debugPrint(selectedDay.toIso8601String());

//                     debugPrint(focusedDayTmp.toIso8601String());
//                     debugPrint(selectedDayTmp.toIso8601String());

//                     setState(() {
//                       buttonText = focusedDay.day.toString();
//                     });
//                   },
//                   onPageChanged: (focusedDay) {
//                     focusedDayTmp = focusedDay;
//                   },
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(buttonText),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
