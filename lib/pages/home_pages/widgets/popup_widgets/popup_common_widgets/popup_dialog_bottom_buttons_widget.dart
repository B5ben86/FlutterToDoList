import 'package:flutter/material.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

Widget buildDialogBottomButtonsWidget(
    String leftButtonText,
    String rightButtonText,
    Function() leftButtonPressed,
    Function() rightButtonPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      TextButton(
        style: TextButton.styleFrom(
          fixedSize: const Size(153, 48),
        ),
        onPressed: leftButtonPressed,
        child: Text(
          leftButtonText,
          style: TextStyle(
            color: themeContext().primaryColor,
            fontSize: 16,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeContext().primaryColor,
          fixedSize: const Size(153, 48),
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: rightButtonPressed,
        child: Text(
          rightButtonText,
        ),
      ),
    ],
  );
}
