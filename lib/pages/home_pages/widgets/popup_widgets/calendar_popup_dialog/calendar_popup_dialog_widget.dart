import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/choose_time_popup_dialog/choose_time_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

void showCalendarPopupDialogWidget(
    BuildContext context, Function(DateTime) onDayTimeSelected) {
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
                    firstDay: DateTime.now()
                        .add(const Duration(days: -30)), //TODO: 可选前后一个月的时间，具体待定
                    lastDay: DateTime.now().add(const Duration(days: 30)),
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
                    (() {
                      showChooseTimePopupDialogWidget(context, ((timeOfDayNew) {
                        var selectedDateTime = DateTime(
                            selectedDayTmp.year,
                            selectedDayTmp.month,
                            selectedDayTmp.day,
                            timeOfDayNew.hour,
                            timeOfDayNew.minute);
                        Navigator.pop(context);

                        onDayTimeSelected(selectedDateTime);
                      }));
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
