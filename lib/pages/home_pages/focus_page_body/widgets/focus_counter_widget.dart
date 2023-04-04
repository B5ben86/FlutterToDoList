import 'package:flutter/material.dart';
import 'package:uptodo/pages/home_pages/focus_page_body/widgets/circular_ring_counter_painter.dart';

class FocusCounterWidget extends StatefulWidget {
  final int counter;
  final int maxCounter;
  const FocusCounterWidget(this.counter, this.maxCounter, {super.key});

  @override
  State<FocusCounterWidget> createState() => _FocusCounterWidgetState();
}

class _FocusCounterWidgetState extends State<FocusCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(213, 213),
      painter: CircularRingCounterPainter(
          counter: widget.counter, maxCounter: widget.maxCounter),
    );
  }
}
