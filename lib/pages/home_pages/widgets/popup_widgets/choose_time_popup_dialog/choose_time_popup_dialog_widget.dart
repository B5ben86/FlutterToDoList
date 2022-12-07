import 'package:flutter/material.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

void showChooseTimePopupDialogWidget(
    BuildContext context, Function(TimeOfDay) timeOfDaySelected) async {
  TimeOfDay? timeOfDayNew = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: themeContext().primaryColor, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: themeContext().primaryColor, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: themeContext().primaryColor,
          )),
        ),
        child: child!,
      );
    },
  );

  if (timeOfDayNew != null) {
    timeOfDaySelected(timeOfDayNew);
  }
  // return timeOfDayNew;
}
