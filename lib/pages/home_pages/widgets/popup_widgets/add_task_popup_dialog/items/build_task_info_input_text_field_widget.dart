import 'package:flutter/material.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

Widget buildTaskInfoInputTextFieldWidget(String placeHolderText, bool autoFocus,
    Function(String text) onEditChanged, Function(String text) onSubmitted) {
  return SizedBox(
    height: 43,
    child: TextField(
      autofocus: autoFocus,
      style: const TextStyle(fontSize: 16),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeContext().primaryColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        hintText: placeHolderText,
      ),
      cursorColor: Colors.white,
      onChanged: (String text) {
        onEditChanged(text);
      },
      onSubmitted: (String text) {
        onSubmitted(text);
      },
    ),
  );
}
