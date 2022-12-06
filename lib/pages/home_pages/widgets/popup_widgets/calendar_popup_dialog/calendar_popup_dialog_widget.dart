import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/choose_time_popup_dialog/choose_time_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

void showCalendarPopupDialogWidget(
    BuildContext context, Function(DateTime) onDaySelected) {
  showDialog(
    context: context,
    builder: (context) {
      DateTime selectedDayTmp = DateTime.now();
      DateTime focusedDayTmp = DateTime.now();
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
              height: 470,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TableCalendar(
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                            color: themeContext().primaryColor,
                            shape: BoxShape.circle)),
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
                    },
                    onPageChanged: (focusedDay) {
                      focusedDayTmp = focusedDay;
                    },
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  buildDialogBottomButtonsWidget(
                    S.current.calendar_popup_dialog_button_cancel,
                    S.current.calendar_popup_dialog_button_choose_time,
                    (() {
                      Navigator.pop(context);
                    }),
                    (() async {
                      // showChooseTimePopupDialogWidget(context);
                      var timeOfDayNew =
                          await showChooseTimePopupDialogWidget(context);
                      if (timeOfDayNew != null) {
                        //TODO: 将日期和时间组合成 DateTime
                        debugPrint(timeOfDayNew.toString());
                      }
                    }),
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
