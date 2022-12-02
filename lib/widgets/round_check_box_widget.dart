import 'package:flutter/material.dart';

class RoundCheckBoxWidget extends StatefulWidget {
  final bool checkedStatus;
  final Function(bool checkedStatusNew) onCheckStatusChanged;
  const RoundCheckBoxWidget(this.checkedStatus, this.onCheckStatusChanged,
      {super.key});

  @override
  State<RoundCheckBoxWidget> createState() => _RoundCheckBoxWidgetState();
}

class _RoundCheckBoxWidgetState extends State<RoundCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: const CircleBorder(),
      value: widget.checkedStatus,
      activeColor: Theme.of(context).primaryColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: ((value) {
        if (value == null) return;
        widget.onCheckStatusChanged(value);
      }),
    );
  }
}
