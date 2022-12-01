import 'package:flutter/material.dart';

Widget buildTitle(String titleText) {
  return Text(
    titleText,
    style: const TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}
