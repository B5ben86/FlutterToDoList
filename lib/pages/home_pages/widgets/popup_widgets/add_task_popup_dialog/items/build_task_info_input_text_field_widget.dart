import 'package:flutter/material.dart';

Widget buildTaskInfoInputTextFieldWidget(String placeHolderText,
    Function(String text) onEditChanged, Function(String text) onSubmitted) {
  return SizedBox(
    // height: 43,
    child: TextField(
      style: const TextStyle(fontSize: 18),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
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
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
