import 'package:flutter/material.dart';

class SearchTaskWidget extends StatefulWidget {
  final Function(String newText) onTextChanged;
  final Function(String text) onSubmitted;
  const SearchTaskWidget(this.onTextChanged, this.onSubmitted, {super.key});

  @override
  State<SearchTaskWidget> createState() => _SearchTaskWidgetState();
}

class _SearchTaskWidgetState extends State<SearchTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Search for your task',
      ),
      cursorColor: Colors.white,
      onChanged: (String text) {
        widget.onTextChanged(text);
      },
      onSubmitted: (value) {
        widget.onSubmitted(value);
      },
    );
  }
}
