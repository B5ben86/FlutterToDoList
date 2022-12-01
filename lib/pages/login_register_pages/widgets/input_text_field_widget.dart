import 'package:flutter/material.dart';

typedef OnTextChangedCallback = Function(String newText);

Widget buildInputTextFieldWidget(
    BuildContext context,
    String titleText,
    String placeHolderText,
    bool isPassword,
    OnTextChangedCallback onTextChangedCallback) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(titleText),
      const Divider(
        height: 8,
        color: Colors.transparent,
      ),
      TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          hintText: placeHolderText,
        ),
        style: const TextStyle(fontSize: 16, color: Colors.white),
        onChanged: (String text) {
          onTextChangedCallback(text);
        },
      ),
    ],
  );
}
